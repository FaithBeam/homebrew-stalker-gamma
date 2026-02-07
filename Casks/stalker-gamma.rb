cask "stalker-gamma" do
  version "1.7.0"
  sha256 "ec0e57687c0780f19452de8d77196cf0a312da33a2e1b9a88fb634247cc83be2"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma+mac.arm64.tar.gz"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on arch: :arm64
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
