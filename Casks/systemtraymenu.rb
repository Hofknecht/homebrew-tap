cask "systemtraymenu" do
  version "3.1.319"
  sha256 "aa93f6d85b3b76b26071bcae5fb05579362ccd268ace8dc2082aff0bd5f233ee"

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
