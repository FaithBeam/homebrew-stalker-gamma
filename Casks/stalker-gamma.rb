cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.37.1"
  sha256 arm:   "285bd30421533287364f34728e2402a1f801aae0905432b3594289b9bc70c578",
         intel: "cd0c94ffc6c0b4aa1f91e057e182e31aa338d3aa5801d87c549a9231157aacb8"

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
