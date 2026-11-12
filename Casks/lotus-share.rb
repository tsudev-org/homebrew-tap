cask "lotus-share" do
  version "1.18.2-lotus.5"
  sha256 "69a3c19a16afd7771c54e16f18d0c293ef88dfec4333081da243115c3cd03628"

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
