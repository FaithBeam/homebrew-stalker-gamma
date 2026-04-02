cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.22.0"

  if Hardware::CPU.arm?
    sha256 "846ef459271c25caad6a3c5c2a47708df18649b99803a46a4d6c80bdc1065bd4"
  else
    sha256 "02b4423523fcc43940ae58cb239606681d0f93ebd1b2eae9268c73d75310ead0"
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
