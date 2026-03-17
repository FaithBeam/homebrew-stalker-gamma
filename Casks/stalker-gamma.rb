cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.20.0"

  if Hardware::CPU.arm?
    sha256 "337feb9662a5825f8b85aeb327c1433d0099258618372e11d2c0406162f85548"
  else
    sha256 "b408316b18914c703c143bd6a166673122b7665b5a7c94c0007a012557972959"
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
