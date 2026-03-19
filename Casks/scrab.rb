cask "scrab" do
  version "1.1.1"
  sha256 "a2c270667fe30fb4155c8ad17780522a1b6bc69d11f4cda77728864c88dd9557"

  url "https://github.com/ljdongz/Scrab/releases/download/v#{version}/Scrab-#{version}.zip"
  name "Scrab"
  desc "macOS screen capture tool"
  homepage "https://github.com/ljdongz/Scrab"

  app "Scrab.app"

  zap trash: [
    "~/Library/Application Support/Scrab",
    "~/Library/Preferences/com.ljdongz.Scrab.plist",
  ]
end
