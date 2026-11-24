cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.44.0"
  sha256 arm:   "61fb8edc3f1a144b76d1a78466a9c9fbc911ff7063127fbeb30cb266bc7add1e",
         intel: "a6bded06eeefe605552909fdaa561b7d29176a4a66bddb549802761786f22808"

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
