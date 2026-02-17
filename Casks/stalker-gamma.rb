cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.11.0"

  if Hardware::CPU.arm?
    sha256 "ce52350442242190ce755b0300444f9c3273d7a146aa727efa3963f213991730"
  else
    sha256 "d64e915231df00f4512189278413bef060a29d69369519460492773b3a67d910"
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
