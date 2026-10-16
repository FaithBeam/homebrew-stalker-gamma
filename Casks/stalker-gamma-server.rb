cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.38.0"
  sha256 arm:   "f140e68dcd1f8d59db113dff9d9827d9e8e87fb7987219558532d5bdd49abb6c",
         intel: "4ab7ee4b36a4e89d42da248d969fcc08e1a892b2c85e00f63fd32eb493d598f5"

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
