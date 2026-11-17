cask "tsudev-sound-db" do
  version "26.11.1701"
  sha256 "b026f2106f2b76ca8f4df67935530b33229a026b8e97b2f9f4ac12576f4a7549"

  url "https://github.com/tsudev-org/sound-db/releases/download/v#{version}/sound-db_#{version}_universal-macos.zip"
  name "Sound Db"
  desc "May do am thanh chinh xac: dB, pho FFT, dai octave, cao do"
  homepage "https://sounddb.tsudev.com/"

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
