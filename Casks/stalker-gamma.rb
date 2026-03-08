cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.5"

  if Hardware::CPU.arm?
    sha256 "30d628206d5409f5fc34ff619d308ec837271ce9448f29f4300e7bcfca70d0dd"
  else
    sha256 "19b4d9a212dc0b70be2bfe09b6986d7b54054981af2fe5f7ef15a899bbf83672"
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
