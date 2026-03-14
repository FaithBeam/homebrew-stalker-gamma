cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.16.1"

  if Hardware::CPU.arm?
    sha256 "e9f815229dfdc471c6ba94c1daf8bf84d2cbc29a504544b74d8bc107a771d42a"
  else
    sha256 "46da4e4927a57d5aa3ca97999e0483a6e6d157c80ace74cca451e966e2aa829c"
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
