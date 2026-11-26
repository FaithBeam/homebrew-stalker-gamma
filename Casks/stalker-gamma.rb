cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.45.0"
  sha256 arm:   "0a3a284e8d2456543f6475a604668dde2082f28292692423b655c50bfd09d061",
         intel: "b673c147fda30ff9f3648a54d439e09d7d26c4accba8e8f213471fa4fac1ffb2"

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
