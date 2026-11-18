cask "lotus-share" do
  version "26.11.1801"
  sha256 "8bb9d7c6ffced3482ce81036d12ff0b3bd763910c1e3dac2724fe178b4f7a0e1"

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
