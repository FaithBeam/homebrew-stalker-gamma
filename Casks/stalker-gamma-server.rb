cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.40.0"
  sha256 arm:   "c8da94b988b06278602b64d4834f28e5e45d290429e0a4e5c756534154604a86",
         intel: "9355dea167d8afcee992c882c271f1f54e651e96ea6727342dc370ccdb267d54"

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
