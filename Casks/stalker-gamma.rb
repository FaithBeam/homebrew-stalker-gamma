cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.21.0"

  if Hardware::CPU.arm?
    sha256 "42e3a276fe1212c50f3bfd55df77438e0f5406c055c90457a1fe8b52de604ebc"
  else
    sha256 "c18d3bd7d96524f2f3867c6461c6f4f9bc809e5fa6b47cc210889ba7f27a93e3"
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
