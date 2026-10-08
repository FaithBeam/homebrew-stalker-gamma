cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.37.1"
  sha256 arm:   "eac152f783d5f1e21a8b74f62c89a3254fd83eaf77c6c3c76915e20b4dc58b7b",
         intel: "7421242e8c42ce288a281735d7542b48c36f8305b5c05cffeb9e64d5af9ea120"

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
