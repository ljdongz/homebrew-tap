cask "scrab" do
  version "1.0.0"
  sha256 "7f390be60a18b1ee796ad8ff2377c14da9e57d3ca40c1780eaeeda3b9fa8eab6"

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
