cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.29.0"

  if Hardware::CPU.arm?
    sha256 "0e41bae181d6e9bb9b4b225ef59fc200bd0fc175064240e48e9b8ab9a2887fb0"
  else
    sha256 "15eb5487d56bbddbe933905dd590495378c507b34ac1f86b007b8eaf14c1e7e0"
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
