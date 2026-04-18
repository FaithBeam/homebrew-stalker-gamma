cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.25.0"

  if Hardware::CPU.arm?
    sha256 "eb2f848cd1564b43cc3403bde7b57d5f10db4bbb2a5d6c68772a7fee4b70a10f"
  else
    sha256 "0be6018e89058ca2fc3bcb1176d496ede7bc43b029ae1eef760e0359b905632a"
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
