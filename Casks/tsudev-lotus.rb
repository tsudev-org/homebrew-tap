cask "tsudev-lotus" do
  version "1.18.2-lotus.4"
  sha256 "42a5645c489032f7e48b063c138e2932707c317473aec7c32a3978f2c1c251ee"

  url "https://github.com/tsudev-org/lotus-share/releases/download/v#{version}/lotus-share-#{version.split("-").first}-macos.dmg"
  name "Lotus Share"
  desc "Gui tep giua cac thiet bi trong cung mang - ban Viet hoa cua LocalSend"
  homepage "https://lotus.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-lotus\.\d+)/i)
  end

  # Ten cu (truoc 12/11/2026). Ma da cong bo khong bo (PACKAGING.md muc 2): may da cai van nhan ban moi qua
  # `brew upgrade`, kem canh bao chuyen sang lotus-share.
  deprecate! date: "2026-11-12", because: "is renamed to lotus-share", replacement_cask: "lotus-share"

  conflicts_with cask: "lotus-share"
  depends_on macos: :monterey

  app "Lotus Share.app"
end
