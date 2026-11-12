cask "lotus-share" do
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

  conflicts_with cask: "tsudev-lotus"
  depends_on macos: :monterey

  app "Lotus Share.app"
end
