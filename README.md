# homebrew-beacon

A [Homebrew](https://brew.sh) tap for [Beacon](https://github.com/jeet427/beacon-releases),
a keyboard-first desktop API client for macOS.

## Install

```bash
brew tap jeet427/beacon
brew install --cask beacon
```

## Update

```bash
brew upgrade --cask beacon
```

## Uninstall

```bash
brew uninstall --cask beacon
# to also remove local data (collections/history/settings):
brew uninstall --cask --zap beacon
```

This tap contains one Cask, [`beacon.rb`](Casks/beacon.rb), which downloads the
architecture-matched DMG from the [beacon-releases](https://github.com/jeet427/beacon-releases)
repo's GitHub Releases and clears the Gatekeeper quarantine flag on install (Beacon is an
unsigned, non-notarized indie app — see that repo's README for why).
