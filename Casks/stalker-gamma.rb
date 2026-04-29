cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.28.0"

  if Hardware::CPU.arm?
    sha256 "12667e1a34af620695a5abcda69f8576b6f846fab2fa9300106995947bf356b2"
  else
    sha256 "c917ca8169298180917b9f0257df8446945c45cd32d2e3439c184883004916f3"
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
