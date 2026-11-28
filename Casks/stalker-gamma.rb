cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.47.0"
  sha256 arm:   "fd38055767b5f55412ce37041bb718eb6f6c800e9ebd08ec59a23e4095aee074",
         intel: "b6d200ca3f49139d2139f5bb0758ee1cc00e1f2524cc6d87ab73f9b12bec4dbf"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.#{arch}.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  binary "stalker-gamma"

  postflight_steps do
     on_macos do
       run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/"]
     end
  end
end
