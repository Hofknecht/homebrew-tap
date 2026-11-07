cask "systemtraymenu" do
  version "3.1.155"
  sha256 "46e4f5dc8260bebe6d5463512eb667cebf7c1e1b58f6f80cc59e7d89da5716e1"

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

  app "SystemTrayMenu.app"

  uninstall quit:      "de.systemtraymenu.app",
            launchctl: "de.systemtraymenu.app"

  zap trash: [
    "~/Library/Application Support/SystemTrayMenu",
    "~/Library/Caches/SystemTrayMenu",
  ]

  caveats <<~EOS
    SystemTrayMenu is not notarized by Apple yet, so macOS blocks the first start.
    Open System Settings, Privacy & Security, and click "Open Anyway".
  EOS
end
