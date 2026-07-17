cask "beacon" do
  version "1.1.0"

  on_arm do
    sha256 "c5eaf4504cfeae0430a45863fbeb963ebd57e93974fbc1a1f5612dcc5f9fc290"
    url "https://github.com/jeet427/beacon-releases/releases/download/v#{version}/Beacon-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "a85b4ba7c5641b34175f84f8cc1bef4080b530d6a119192f9652478d778abf67"
    url "https://github.com/jeet427/beacon-releases/releases/download/v#{version}/Beacon-#{version}.dmg"
  end

  name "Beacon"
  desc "Keyboard-first desktop API client (Postman-style)"
  homepage "https://github.com/jeet427/beacon-releases"

  app "Beacon.app"

  # Beacon isn't notarized (no paid Apple Developer subscription) — clear the
  # quarantine flag Gatekeeper attaches on download so the app opens normally
  # instead of macOS refusing to launch it as "from an unidentified developer".
  postflight do
    system_command "/usr/bin/xattr",
                    args: ["-cr", "#{appdir}/Beacon.app"],
                    sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Beacon",
    "~/Library/Saved Application State/com.vivek.beacon.savedState",
    "~/Library/Preferences/com.vivek.beacon.plist",
  ]
end
