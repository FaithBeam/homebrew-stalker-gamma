cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.43.1"
  sha256 arm:   "19788e97aa5abec448c0ac151aaeb3a21ae49edde74fc1546cd1db9303fec359",
         intel: "0fb96c7eb8b67f075f61bb4178cbb04075d4f78cdcf1a659a52ba464fafcb6b7"

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
