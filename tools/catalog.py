#!/usr/bin/env python3
"""Sinh catalog.json (danh muc may doc, schema 1) tu Casks/*.rb - nguon cho website *.tsudev.com va install.sh
cua tsudev.com (tsudev-standards PACKAGING.md muc 6, 8), cung dang voi https://pkg.tsudev.com/catalog.json.

Tat dinh, chi gom cask dang co trong tap (moi cask tren main da qua CI cai thu that tren macOS).
Cask `deprecate! ... replacement_cask: "<moi>"` ghi `replacedBy`.

  python3 tools/catalog.py           # ghi catalog.json
  python3 tools/catalog.py --check   # CI: loi neu catalog.json cu so voi Casks/
"""
from __future__ import annotations

import json
import re
import sys
from pathlib import Path

GOC = Path(__file__).resolve().parent.parent
TAP = "tsudev-org/tap"
MACOS = {"monterey": "12", "ventura": "13", "sonoma": "14", "sequoia": "15", "tahoe": "26"}


def chuoi(s: str, khoa: str) -> str | None:
    m = re.search(rf'^\s*{khoa} "([^"]*)"', s, re.M)
    return m.group(1) if m else None


def build() -> dict:
    pkgs = []
    for f in sorted((GOC / "Casks").glob("*.rb")):
        s = f.read_text(encoding="utf-8")
        n = re.search(r'^cask "([a-z0-9-]+)" do', s, re.M)
        if not n or n.group(1) != f.stem:
            sys.exit(f"{f.name}: ten cask khong khop ten tep")
        n = n.group(1)
        moi = re.search(r'deprecate!.*replacement_cask: "([a-z0-9-]+)"', s)
        macos = re.search(r"depends_on macos: :(\w+)", s)
        pkgs.append({
            "name": n,
            "version": chuoi(s, "version"),
            "displayName": chuoi(s, "name"),
            "description": chuoi(s, "desc"),
            "homepage": chuoi(s, "homepage"),
            # `arch arm: ..., intel: ...` = hai ban rieng; khong co = mot tep cho moi may Mac.
            "arch": ["arm64", "x64"] if re.search(r"^\s*arch arm:", s, re.M) else ["any"],
            "minMacos": MACOS.get(macos.group(1)) if macos else None,
            "commands": re.findall(r'^\s*binary .*target: "([^"]+)"', s, re.M),
            "replacedBy": moi.group(1) if moi else None,
            "install": f"brew install --cask {TAP}/{n}",
            "installFull": f"brew install --cask {TAP}/{n}",
        })
    ten = {p["name"] for p in pkgs}
    for p in pkgs:
        if not p["version"] or not p["homepage"]:
            sys.exit(f"{p['name']}: thieu version/homepage")
        if p["replacedBy"] and p["replacedBy"] not in ten:
            sys.exit(f"{p['name']}: replacedBy {p['replacedBy']} khong co trong tap")
    return {
        "schema": 1,
        "channel": "homebrew",
        "tap": {"name": TAP, "url": "https://github.com/tsudev-org/homebrew-tap"},
        "setup": [],
        "packages": pkgs,
    }


def main() -> None:
    out = GOC / "catalog.json"
    text = json.dumps(build(), ensure_ascii=False, indent=1) + "\n"
    if "--check" in sys.argv:
        if not out.exists() or out.read_text(encoding="utf-8") != text:
            sys.exit("catalog.json cu - chay: python3 tools/catalog.py")
        print("catalog.json khop Casks/")
        return
    with open(out, "w", encoding="utf-8", newline="\n") as fh:
        fh.write(text)
    print(f"catalog.json: {len(json.loads(text)['packages'])} cask")


if __name__ == "__main__":
    main()
