cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.10.0"

  if Hardware::CPU.arm?
    sha256 "817bfa01168fc76e90354e0d66003cde1c261e0645d3c7055a6da51dacaedd75"
  else
    sha256 "a5dc8df97a523800552908429a80084897995ca2e04360ea4800d00f5ed19680"
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
