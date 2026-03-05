cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.2"

  if Hardware::CPU.arm?
    sha256 "8e73dd06df9d380e71ef8c9e88ed06267658caca7026b3cdd565106ecbcfdfb9"
  else
    sha256 "90c560aa9c2ecf6d3594dd919ac9f19badea3b00c89cdd8700e88c3effe62e26"
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
