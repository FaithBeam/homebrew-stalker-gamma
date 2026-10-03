cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.35.0"

  if Hardware::CPU.arm?
    sha256 "109c3b008ee7d5d49e935c6ea0dece3f1a36ee459ff61b9528af58e9cae35da0"
  else
    sha256 "f304eebefc972dc60b926221c6e60ecfe3e2539463971c966e93cd67e96add97"
  end

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.#{arch}.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on formula: "libidn2"
  depends_on formula: "zstd"

  binary "stalker-gamma"

  postflight_steps do
    on_macos do
      run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/"]
    end
  end

  zap trash: ""
end
