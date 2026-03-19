cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.20.5"

  if Hardware::CPU.arm?
    sha256 "ac930c54ea49c6cabeb6976d6ec1573b68d590eb30e64d8361860c3cebd2bb74"
  else
    sha256 "dc23c26cfc4d7e0adb578095afc47c2a7c9547ac68e959f25fe91a249e20498b"
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
