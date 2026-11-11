cask "tsudev-lotus" do
  version "1.18.2-lotus.2"
  sha256 "fa2b0cce93f1ab840c394465e11a9c38c057cadf422664e13de0399da9414cf0"

  url "https://github.com/tsudev-org/tsudev-lotus/releases/download/v#{version}/tsudev-lotus-#{version.split("-").first}-macos.dmg"
  name "tsudev Lotus"
  desc "Gui tep giua cac thiet bi trong cung mang - ban Viet hoa cua LocalSend"
  homepage "https://lotus.tsudev.com"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-lotus\.\d+)/i)
  end

  depends_on macos: ">= :monterey"

  app "tsudev-lotus.app"
end
