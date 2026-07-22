cask "beacon" do
  version "1.3.3"

  on_arm do
    sha256 "c05542e602aaaef35e938b5eca76ddd18467e2243cc46ce42d38e6b34260d1a0"
    url "https://github.com/jeet427/beacon-releases/releases/download/v#{version}/Beacon-#{version}-arm64.dmg"
  end
  on_intel do
    sha256 "6136c1e9636802542bfe4ce05acff972fe3a04352a69334b2fccd7956a8e090c"
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
