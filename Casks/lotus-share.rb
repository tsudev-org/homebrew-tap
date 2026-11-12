cask "lotus-share" do
  version "1.18.2-lotus.3"
  sha256 "a6d44cff23af1c9316fcaa4e65eb052c0ea53e9959675b2b67a5c59845bcfc39"

  url "https://github.com/tsudev-org/lotus-share/releases/download/v#{version}/lotus-share-#{version.split("-").first}-macos.dmg"
  name "Lotus Share"
  desc "Gui tep giua cac thiet bi trong cung mang - ban Viet hoa cua LocalSend"
  homepage "https://lotus.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-lotus\.\d+)/i)
  end

  depends_on macos: :monterey

  app "Lotus Share.app"
end
