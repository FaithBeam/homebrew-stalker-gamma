cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.34.0"

  if Hardware::CPU.arm?
    sha256 "ddce1d5464562c24471101480b50f53b13d306ffcffec9b48913a0cbf56ce918"
  else
    sha256 "b1993e97426e1aca5fc01e97e42dcf3f72964be91c693a44dc30f433aceec194"
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
