cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.14.1"

  if Hardware::CPU.arm?
    sha256 "8bed99e3856c6af2ec105a1b0eecf6733664bad98ea41755773da51dcb9a4fd1"
  else
    sha256 "d95e2e70adc9dca90427b6a2b7fcf26e5708ba444783b9f56bcb60c6e213a18a"
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
