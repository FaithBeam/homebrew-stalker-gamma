cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.42.0"
  sha256 arm:   "ba97fbc589b23dae7ec11362e711623baaa1c49357c6c2612662843c00d71fad",
         intel: "49a7772da882cd84c5b3ea9d4cafd8b729141995567c373ecaed37aa4fc192d8"

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
