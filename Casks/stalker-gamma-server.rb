cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.46.0"
  sha256 arm:   "3acc0499eeca037abc07d03e105c98b36bafe222bde5be21d9b51a48ea1f516a",
         intel: "c2aafa24812833f6e75419d4b5a8174f7a42df4adcd5b5c4880151dfdcb6db33"

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
