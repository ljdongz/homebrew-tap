cask "scrab" do
  version "1.0.2"
  sha256 "918c91e4e64906c02a45ef3b90540ca8a6e62646849b15d267e2c88b8c25dced"

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
