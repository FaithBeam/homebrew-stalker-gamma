cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.18.0"

  if Hardware::CPU.arm?
    sha256 "a87ec6f139aa76b8c53f383c5da8dda468a19bf3e7f55476aca484362df8bb65"
  else
    sha256 "dc8d99c8f34e11c97696995363af22c32d1a34664c7ce306346dcf7169a63580"
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
