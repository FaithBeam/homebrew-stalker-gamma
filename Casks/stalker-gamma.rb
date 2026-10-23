cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.39.0"
  sha256 arm:   "cacfee1ed98eadf78f24e75965d22a20ef97561d0c189b09d29126507aab6900",
         intel: "7eafa70442ad8687b566a727ddc0d524cab5f6b76e324f30a9d9232e76a3c9f5"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.#{arch}.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on formula: "libidn2"
  depends_on formula: "zstd"

  binary "stalker-gamma"

  postflight_steps do
     on_macos do
       run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{staged_path}}/"]
     end
  end
end
