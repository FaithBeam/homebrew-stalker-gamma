cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.27.0"

  if Hardware::CPU.arm?
    sha256 "8f632af1c3308646a1008f55085f9cab45e5e3aa2ab243bc92efbdd2b780d1be"
  else
    sha256 "abe8ed9b74218550dfd8f7c98b38c7bdc33f5e7e9c0a285374725942a2227156"
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
