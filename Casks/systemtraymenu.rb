cask "systemtraymenu" do
  version "3.1.351"
  sha256 "a6ca08e47a2794364ab66d58fcdb1c2dc5102b28395561c4c371af2cee7edce9"

  url "https://hofknecht.eu/systemtraymenu/download/#{version}/SystemTrayMenu-#{version}-macos-arm64.zip"
  name "SystemTrayMenu"
  desc "Menu bar launcher that shows folders as searchable menus"
  homepage "https://hofknecht.eu/systemtraymenu/en.html"

  livecheck do
    url "https://hofknecht.eu/systemtraymenu/updates/SHA256SUMS.txt"
    regex(/SystemTrayMenu[._-]v?(\d+(?:\.\d+)+)[._-]macos[._-]arm64\.zip/i)
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "SystemTrayMenu.app"

  uninstall launchctl: "de.systemtraymenu.app",
            quit:      "de.systemtraymenu.app"

  zap trash: [
    "~/Library/Application Support/SystemTrayMenu",
    "~/Library/Caches/de.systemtraymenu.app",
    "~/Library/Caches/SystemTrayMenu",
    "~/Library/Logs/SystemTrayMenu.log",
  ]

  caveats <<~EOS
    SystemTrayMenu is not notarized by Apple yet, so macOS blocks the first start.
    Open System Settings, Privacy & Security, and click "Open Anyway".
  EOS
end
