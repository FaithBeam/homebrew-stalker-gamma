cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.20.4"

  if Hardware::CPU.arm?
    sha256 "bc9a7dc75b366c2bf76c4d7305a13963d9ffa5471f4fc458d82b9cdddc8b4ec6"
  else
    sha256 "0c5b83d36d4306632b3280ad4e51ffcbaa08402679b33e6492291d1322ac4e30"
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
