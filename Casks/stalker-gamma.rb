cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.3"

  if Hardware::CPU.arm?
    sha256 "0914af5f20f7af205b3891d709307835fd26603e0a265da9c8c1250fc0a373cd"
  else
    sha256 "574e0a61e3fe05829632a14233388737d3250b83dce9cf28849aea404a1be388"
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
