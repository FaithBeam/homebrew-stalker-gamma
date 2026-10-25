cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.40.0"
  sha256 arm:   "61449e686100e79ae62ed45d4038e4b86ccf4e855a03f0f87e040e8c488b358a",
         intel: "b2e695379805fcc7a0c4425812ba128384b0276490228ee7085618bf1d098288"

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
