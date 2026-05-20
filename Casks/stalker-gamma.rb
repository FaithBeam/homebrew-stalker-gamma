cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.33.0"

  if Hardware::CPU.arm?
    sha256 "0b9373e35a2ca3b4b5f43f5dd53b127683f5e3f532639a16b4f6612719df2e65"
  else
    sha256 "9771c40049a2b5f71a50a933171c9aee1fa4a4dd4ccbd18d22ba21daf84c6402"
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
