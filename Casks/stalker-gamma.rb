cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.9.1"

  if Hardware::CPU.arm?
    sha256 "43f9c11d8ee668af3e38b2d2fe67cf19fc67e59f5a84332b24c15c7767240ec4"
  else
    sha256 "c90f8e2bdbe4a5d854b03909b3d6c4f36bcfbb65ed98baaef4fae9447a8b2e76"
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
