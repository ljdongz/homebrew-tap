cask "scrab" do
  version "1.1.0"
  sha256 "dd795bdbb151c4c29b1929e767d203a97c5c3a5908612560ec43f14e1e724af5"

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
