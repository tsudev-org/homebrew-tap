cask "tsudev-sound-db" do
  version "26.11.2302"
  sha256 "a103644548ba2d32b733df69432532dd820593ca3a5614bf65a8c983bdbbeaf2"

  url "https://github.com/tsudev-org/sound-db/releases/download/v#{version}/sound-db_#{version}_universal-macos.zip"
  name "Sound Db"
  desc "May do am thanh chinh xac: dB, pho FFT, dai octave, cao do"
  homepage "https://sound.tsudev.com/"

  livecheck do
    url :url
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: :monterey

  app "Sound Db.app"

  zap trash: [
    "~/Library/Application Support/com.tsudev.sounddb",
    "~/Library/Containers/com.tsudev.sounddb",
    "~/Library/Preferences/com.tsudev.sounddb.plist",
  ]

  caveats <<~EOS
    Ban macOS chua ky bang chung thu Apple Developer. Lan dau mo: chuot phai vao Sound Db > Mo.
    Kiem chung nguon goc: gh attestation verify <tep> -R tsudev-org/sound-db
  EOS
end
