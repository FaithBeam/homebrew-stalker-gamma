cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.30.0"

  if Hardware::CPU.arm?
    sha256 "aeb6e01a64ff0637c32275712e3358c6438e83ea9d7acf878dc492ac085ffd84"
  else
    sha256 "40924a36c1344cece20064382123334e75138fc7b4925ff2ba698f7d45299170"
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
