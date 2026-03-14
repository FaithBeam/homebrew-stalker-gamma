cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.16.2"

  if Hardware::CPU.arm?
    sha256 "afdd5b724509709796196691115039b99ac1fcbb2a4e9bd346cd5cb24377e9fb"
  else
    sha256 "e8c146a54e3d6691945a564a44eb454c3cdbb30c8a599406c6d6991df3fa7f53"
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
