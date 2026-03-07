cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.15.4"

  if Hardware::CPU.arm?
    sha256 "05e24de68259c4e0acafabef35dfc94b71ba510ca98382a29cc65c23c7b17a59"
  else
    sha256 "c5a98d0a0e4f130bafa5bd538a95c6628b7db5ae615d9a710c6b5b7700c5c5c5"
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
