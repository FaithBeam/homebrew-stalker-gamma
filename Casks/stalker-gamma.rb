cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.46.0"
  sha256 arm:   "ccfeaa6c97a23d09265483310464039fbada34e99d52e676d13b2702ab92c1a6",
         intel: "886f361b3f5e4d543adf5c75f73be8965053635fea1c4095346b3064a1f670c4"

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
