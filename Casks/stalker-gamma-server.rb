cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.42.0"
  sha256 arm:   "3ed5794aeebdd0e1d55cbec465fe1aad1e86fd4e4c9fbdbed8e189b2d4c87b98",
         intel: "db5705a5581de0d126caa6e9d5357a2547c4391570122283d8382f844824d237"

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
