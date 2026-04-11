cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.23.1"

  if Hardware::CPU.arm?
    sha256 "322014352023d1f330389781e984f8b916ef0d83f85b620573e20e8ced3b06f7"
  else
    sha256 "6ed85ce986ede77a1298a764218e36faa7c1e50d2cfc5db90b8abd4c8dd89a68"
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
