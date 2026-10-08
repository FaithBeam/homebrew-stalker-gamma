cask "stalker-gamma-server" do
  arch arm: "arm64", intel: "x64"

  version "1.37.0"
  sha256 arm:   "6af907be41093e50c5b0bf66f1f5df5e138bbb65f92fd9f243a4b1e3958fc0d7",
         intel: "097d8a1e7e60786c22b683a050e831c92807728e0766a5359c2f9e4f507d45f1"

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
