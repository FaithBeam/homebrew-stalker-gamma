cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.39.0"
  sha256 arm:   "f5bd2c8f9057742409e294f0f7e33b01b556883a4c8934a8414adb503c1d9684",
         intel: "da7303de4265ccbb67faffcba267a011e3484f2e4fad51823f6d1d90f2c24666"

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
