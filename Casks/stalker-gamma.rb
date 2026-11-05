cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.41.0"
  sha256 arm:   "1b3d29076ba273590265c8c1627be0e4f5ed8185aad4ce61631d9fc25e2b2034",
         intel: "dcbff96eb81909e6f301582e23b6e95b511a3813280b423a5d906a50f270e575"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.#{arch}.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on formula: "libidn2"
  depends_on formula: "zstd"

  binary "stalker-gamma"

  postflight_steps do
     on_macos do
       run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/"]
     end
  end
end
