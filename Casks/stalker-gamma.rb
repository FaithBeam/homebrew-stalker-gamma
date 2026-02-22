cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.14.2"

  if Hardware::CPU.arm?
    sha256 "ae19b9f4920843b4a3c6743d582ec2aa0e24a45fd7548a81d419928c34d94bee"
  else
    sha256 "3c392a89370ae5f92539eb7b9b1eb52196617bc14dc6d40c19fd7bcdbbd17a90"
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
