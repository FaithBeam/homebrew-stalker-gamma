cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.17.0"

  if Hardware::CPU.arm?
    sha256 "b6df18bdfaf9847aab2ee3508e6d413fe96e0c64406a80ea119ee25a0f018ba3"
  else
    sha256 "831d0612eeaac900bb95ca4e964b9759260246de03c4c252ce8e2323f2b5c713"
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
