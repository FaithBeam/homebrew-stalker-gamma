cask "stalker-gamma" do
  version "0.1.0"
  sha256 "dc4a5a7c2635aee7f8f2d3ef24d69984a01df8b660e426b18a1aa9d144fc4c24"

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
