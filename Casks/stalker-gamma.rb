cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.13.0"

  if Hardware::CPU.arm?
    sha256 "98a07c1126b95a09c26cdfa33661c6694e54c2427237fd705ddf684333ab7ef5"
  else
    sha256 "836a68afe28a615236c60557a903476633d239093413dda0cec97477f94b7537"
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
