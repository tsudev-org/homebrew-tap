cask "lotus-share" do
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

  conflicts_with cask: "tsudev-lotus"
  depends_on macos: :monterey

  app "Lotus Share.app"
end
