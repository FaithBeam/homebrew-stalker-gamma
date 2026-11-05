cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.41.0"
  sha256 arm:   "c9869cecddfe87bf0db89487bff2b9c0db080bbd4f48e81eed93ebbedf7cc8bf",
         intel: "d94a8248d9888603defcb7a7e4ad54897d7aacfec73c3ab622f0a615954c7a78"

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
