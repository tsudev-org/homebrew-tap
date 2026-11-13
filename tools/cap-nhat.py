"""Cap nhat Casks/*.rb theo GitHub Release moi nhat cua tsudev-org.

Ma bam lay tu SHA256SUMS cua chinh Release (khong tinh lai tu tep tai ve) va doi chieu voi tep tai ve.
Chay: python3 tools/cap-nhat.py  (can GH_TOKEN de tranh gioi han API).
"""
import hashlib, json, os, re, sys, urllib.request

def get(url):
    req = urllib.request.Request(url, headers={"User-Agent": "tsudev-homebrew-tap"})
    tok = os.environ.get("GH_TOKEN")
    if tok and url.startswith("https://api.github.com/"):
        req.add_header("Authorization", f"Bearer {tok}")
    with urllib.request.urlopen(req, timeout=120) as r:
        return r.read()

def sums(urls):
    out = {}
    for u in urls:
        for line in get(u).decode().splitlines():
            p = line.split()
            if len(p) == 2:
                out[p[1].lstrip("*")] = p[0]
    return out

def latest(repo):
    return json.loads(get(f"https://api.github.com/repos/tsudev-org/{repo}/releases/latest"))["tag_name"].lstrip("v")

def kiem(url, h):
    if hashlib.sha256(get(url)).hexdigest() != h:
        sys.exit(f"Ma bam khong khop: {url}")

doi = False
p = "Casks/tsudev-files.rb"; s = open(p).read()
v = latest("tsudev-files"); cu = re.search(r'version "([^"]+)"', s).group(1)
if v != cu:
    base = f"https://github.com/tsudev-org/tsufiles/releases/download/v{v}"
    t = sums([f"{base}/tsudev-files-{v}-osx-{a}-SHA256SUMS.txt" for a in ("arm64", "x64")])
    ha, hi = t[f"tsudev-files-{v}-osx-arm64.tar.gz"], t[f"tsudev-files-{v}-osx-x64.tar.gz"]
    kiem(f"{base}/tsudev-files-{v}-osx-arm64.tar.gz", ha)
    s = s.replace(cu, v)
    s = re.sub(r'arm:   "[0-9a-f]{64}"', f'arm:   "{ha}"', s)
    s = re.sub(r'intel: "[0-9a-f]{64}"', f'intel: "{hi}"', s)
    open(p, "w").write(s); doi = True; print(f"tsudev-files {cu} -> {v}")

# Lotus Share; tsudev-lotus = ten cu (deprecate!) van tro cung ban moi de may da cai nhan cap nhat.
for p in ("Casks/lotus-share.rb", "Casks/tsudev-lotus.rb"):
  s = open(p).read()
  v = latest("lotus-share"); cu = re.search(r'version "([^"]+)"', s).group(1)
  if v != cu:
      base = f"https://github.com/tsudev-org/lotus-share/releases/download/v{v}"
      ten = f"lotus-share-{v.split('-')[0]}-macos.dmg"
      h = sums([f"{base}/SHA256SUMS.txt"])[ten]
      kiem(f"{base}/{ten}", h)
      s = s.replace(cu, v)
      s = re.sub(r'sha256 "[0-9a-f]{64}"', f'sha256 "{h}"', s)
      open(p, "w").write(s); doi = True; print(f"{p} {cu} -> {v}")

print("co thay doi" if doi else "khong co ban moi")
