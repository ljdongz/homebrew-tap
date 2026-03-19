cask "scrab" do
  version "1.1.3"
  sha256 "2a4172525ed949dce7c4782d9c20aca5b3f9e8a4d6b46abbcaea1762c81322f6"

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
