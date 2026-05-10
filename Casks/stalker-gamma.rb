cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.28.2"

  if Hardware::CPU.arm?
    sha256 "ff3faf8b68c89f562f7ef9d72e6765a383cd7caecd55319e64b297bc94e5ed27"
  else
    sha256 "2f28677b8086f29145dee806eaf2af2f4c53bd13169f8c3afaf0785020f740b5"
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
