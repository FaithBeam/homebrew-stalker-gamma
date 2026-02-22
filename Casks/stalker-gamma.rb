cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.14.5"

  if Hardware::CPU.arm?
    sha256 "4107ab34b58070d831e47f8720fc509d98419007d450c99eac3f1af18337f87c"
  else
    sha256 "88575ad4965e4cf7ee049cef38fe57cf184988bc912313545ef03a5f694adcf0"
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
