cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.1"

  if Hardware::CPU.arm?
    sha256 "aaa56cb5f15196f293a9d9d762387866faea7c6e713b4cf45c249e37d108a9a3"
  else
    sha256 "5e946528dc76f1028920f15570181102cc9c4040aabea0a45bae59d93ac870d1"
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
