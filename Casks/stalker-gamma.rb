cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.19.0"

  if Hardware::CPU.arm?
    sha256 "a103a962a052605b4f383797a615b242412244a53ed3d35685eaf4d3502c20ca"
  else
    sha256 "e8ebb760a239a4b602b7728c3c2a519db4234038e43947703c5ebed656bb2c97"
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
