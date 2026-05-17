cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.31.0"

  if Hardware::CPU.arm?
    sha256 "eb7b4b011a3367ef1fd764c332faccca989c8d5aded3c14d012142538b760891"
  else
    sha256 "8c689aebc10068843f139a3036fa869e80c9dc2da880e0c64a8ea90d000a5767"
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
