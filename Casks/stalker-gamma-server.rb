cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.47.0"
  sha256 arm:   "fd7eae74296231631d1028a51497f6b097f4105dd98ee1772f85a072f184cdc4",
         intel: "d982df7a81ef5280ba80f00c520f30905f25805b9ff099641c1435ea2123789e"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma-server+mac.#{arch}.tar.gz"
  name "stalker-gamma-server"
  desc "Companion server for stalker-gamma-cli"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  binary "stalker-gamma-server"

  postflight_steps do
     on_macos do
       run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/"]
     end
  end
end
