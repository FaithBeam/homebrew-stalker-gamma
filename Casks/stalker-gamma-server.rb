cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.44.0"
  sha256 arm:   "c204191d4e067da6fefbbdf3048fabbd31195e9c3b891b71fc3487adcd60003e",
         intel: "154ae794874a4814b50d7612a299c39c78fc3715f8892d2a432bd05481072b00"

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
