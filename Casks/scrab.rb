cask "scrab" do
  version "1.0.1"
  sha256 "730c7fbcea5e2c94e0a96a7bfe807ee635e62ccb3eb636e8420d2303de8c77de"

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
