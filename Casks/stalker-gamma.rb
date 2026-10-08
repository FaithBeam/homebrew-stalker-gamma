cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.37.0"
  sha256 arm:   "87cd9550dea2243daa685c37006538aa3e576b097fd66c345d246760063e4d48",
         intel: "213f2fdaa0dcdd4dd870f7754e7200125291d73b105eb9eb3b447cedbf9e1a36"

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
