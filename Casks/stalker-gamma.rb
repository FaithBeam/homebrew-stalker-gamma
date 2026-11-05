cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.41.1"
  sha256 arm:   "7166659154ace1477de4588cfdb3206d8c6d64e4749dce42f81e34d42bada63f",
         intel: "641083fb8b2e511db83dad53a2b9055cea539feda2bce0c98cf465ad087475d4"

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
