cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.43.1"
  sha256 arm:   "65d307adfdeac54edd0d5715d36be49179b888d706018f108118254beaf4e0d5",
         intel: "2aef21cd4fa7d898d9289fac1d9cd1c674151c624b03198809d8f497bb5de074"

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
