cask "stalker-gamma" do
  version "0.3.0"
  sha256 "725fe439064a62b063c57dc98572454bbaa7a6d4ff9547ec87d15b422bfaedf2"

  url "https://github.com/FaithBeam/stalker-gamma-cli/releases/download/#{version}/stalker-gamma-cli.#{version}+mac.arm64.zip"
  name "stalker-gamma"
  desc "Install Stalker GAMMA via CLI"
  homepage "https://github.com/FaithBeam/stalker-gamma-cli"

  depends_on arch: :arm64
  depends_on formula: "git"
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
