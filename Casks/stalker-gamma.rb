cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.16.6"

  if Hardware::CPU.arm?
    sha256 "c36bfc97f314d756a1410c54db448fdebb198c6c69e9db3e72b6aff7355f2701"
  else
    sha256 "532589fd3a4f7b9b8421825b2b6939fea424d1056929c9695a2ee5507b039a99"
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
