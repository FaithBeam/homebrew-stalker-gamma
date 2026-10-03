cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.36.1"

  if Hardware::CPU.arm?
    sha256 "689b4001802aa56fb8b1729f5d47c537c41725f77c26625cb44399b7f1bba6a7"
  else
    sha256 "a28fd3d72853b2ef53641500311696f090c47bc9384e21889426129091284cd5"
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
