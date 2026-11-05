cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.41.1"
  sha256 arm:   "01aecde135c829cfb7511c63095a58d42a1f250809321b9605c3fed8947115de",
         intel: "59ea802b331ed2f3919b5f65cdca1103383ef7b1d87d1b6fa1aa1a8815ca0162"

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
