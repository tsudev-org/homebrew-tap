cask "tsudev-lotus" do
  version "26.11.1901"
  sha256 "0110494563bc1a4d9a85a7cb746224115425495c9641c229b89a7e2a3f8118f9"

  url "https://github.com/tsudev-org/lotus-share/releases/download/v#{version}/lotus-share_#{version}_macos-universal.dmg"
  name "Lotus Share"
  desc "Gui tep giua cac thiet bi trong cung mang, khong can Internet"
  homepage "https://lotus.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  # Ten cu (truoc 12/11/2026). Ma da cong bo khong bo (PACKAGING.md muc 2): may da cai van nhan ban moi qua
  # `brew upgrade`, kem canh bao chuyen sang lotus-share.
  deprecate! date: "2026-11-12", because: "is renamed to lotus-share", replacement_cask: "lotus-share"

  conflicts_with cask: "lotus-share"
  depends_on macos: :monterey

  app "Lotus Share.app"
end
