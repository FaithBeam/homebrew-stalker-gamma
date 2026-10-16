cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.38.0"
  sha256 arm:   "e8fd859f5230023b21e055f07e6266eec1dda0e65d6a754bde753afa795507dc",
         intel: "855fe89c03ab2abd726c4bb45d71de6ffa5e2b0e1b8966e7e8e111c67dcb902d"

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
