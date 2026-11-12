cask "lotus-share" do
  version "2.0.0-lotus.7"
  sha256 "2a49b1cb7254c1bfc0634e2ffeda6f0675c5d3e3af6ae018fc5806bd1553a131"

  url "https://github.com/tsudev-org/lotus-share/releases/download/v#{version}/lotus-share-#{version.split("-").first}-macos.dmg"
  name "Lotus Share"
  desc "Gui tep giua cac thiet bi trong cung mang - ban Viet hoa cua LocalSend"
  homepage "https://lotus.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-lotus\.\d+)/i)
  end

  conflicts_with cask: "tsudev-lotus"
  depends_on macos: :monterey

  app "Lotus Share.app"
end
