cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.26.1"

  if Hardware::CPU.arm?
    sha256 "fa977d3049f959458da8ae0e4c15c3e138489a58fee971719c9db7e7286c545e"
  else
    sha256 "54d6c6903eebc2980377b5949461b4090d97448fd233a0df23b998b8f35fde54"
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
