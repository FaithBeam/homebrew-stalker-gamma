cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.45.0"
  sha256 arm:   "2de957da3ec5835c619e495d18ce0bf08ec524404ed1e22994e2976e66b38fb4",
         intel: "9fac51def8975f50c5d4ab962176d548412c569a9c3955ee4e21474897016a15"

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
