cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.16.0"

  if Hardware::CPU.arm?
    sha256 "4831e98517e5722b096ef0f8e017d7c1764105d55ee2d94184083875b187a4fe"
  else
    sha256 "22445393b91c1e64d96ef3a5a349de0fdbf5860ee2c29a8afa97b800462bd874"
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
