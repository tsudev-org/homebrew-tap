cask "tsudev-files" do
  arch arm: "arm64", intel: "x64"

  version "2.4.1-vn.1"
  sha256 arm:   "c5de5ad2b1cba52764bcd407708372604a679b815c3b8ef9acc6b4caf306ea52",
         intel: "a6b1f62fd95ee48f5e8bee98e5a0774b01f25f6e3de41c229a7d3a6e3e2c09d1"

  url "https://github.com/tsudev-org/tsufiles/releases/download/v#{version}/tsudev-files-#{version}-osx-#{arch}.tar.gz"
  name "TsuFiles"
  desc "Chuyen doi tep ngoai tuyen 260+ dinh dang - ban Viet hoa cua Filee"
  homepage "https://files.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+-vn\.\d+)/i)
  end

  depends_on :macos

  # Tu 2.4.1: bundle TsuFiles.app, lenh tsufiles-cli (phieu linux-packages 20261113-04 muc 2).
  # Giu lenh `tsudev-files` cho script cu cua nguoi dung.
  app "tsudev-files-#{version}-osx-#{arch}/TsuFiles.app"
  binary "#{appdir}/TsuFiles.app/Contents/MacOS/tsufiles-cli", target: "tsufiles"
  binary "#{appdir}/TsuFiles.app/Contents/MacOS/tsufiles-cli", target: "tsudev-files"
end
