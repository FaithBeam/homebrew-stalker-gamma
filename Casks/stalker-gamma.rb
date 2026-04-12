cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.24.0"

  if Hardware::CPU.arm?
    sha256 "42c83ce0124985257fa77f1ea9c3c1d896708dbe4a3792198df775ed0c51f2ad"
  else
    sha256 "5f1e75c3c86b6cf628d0b9e55e18a4c7e77ec7bc6b37e9311fdfb813eba86b33"
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
