cask "tsudev-files" do
  arch arm: "arm64", intel: "x64"

  version "2.4.0-vn.1"
  sha256 arm:   "ccb8050a0c9cb4f0b9037caba7a70c4a5ab3a6178f48ca166f8b74cb55dcec93",
         intel: "a9d9f746db94d72def94b6c5089aab9059c84488d5833650f8152574eb527895"

  url "https://github.com/tsudev-org/tsudev-files/releases/download/v#{version}/tsudev-files-#{version}-osx-#{arch}.tar.gz"
  name "tsudev Files"
  desc "Chuyen doi tep ngoai tuyen 260+ dinh dang - ban Viet hoa cua Filee"
  homepage "https://files.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-vn\.\d+)/i)
  end

  depends_on :macos

  app "tsudev-files-#{version}-osx-#{arch}/Filee.app", target: "tsudev Files.app"
  binary "#{appdir}/tsudev Files.app/Contents/MacOS/filee-cli", target: "tsudev-files"
end
