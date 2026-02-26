cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.0"

  if Hardware::CPU.arm?
    sha256 "85642b1b0a37362a0b15618c8aba7b2404d27b4bc4d9c58b8ce643e7ac4b2e56"
  else
    sha256 "67123686a2660857e513a44676fef87e95a14713cb104f938b8c8d1d6f51a639"
  end

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.#{arch}.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on formula: "libidn2"
  depends_on formula: "zstd"

  binary "stalker-gamma"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-rd", "com.apple.quarantine", "#{staged_path}/"],
                   print_stderr: false
  end

  zap trash: ""
end
