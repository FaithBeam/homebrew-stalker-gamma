cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.20.6"

  if Hardware::CPU.arm?
    sha256 "664fa4f32071fe8aea25fcc68d21ea3653f2cda66deefb241c1346659ae24687"
  else
    sha256 "0047d6c2489817dd87f3f838bff762616165f99c0e7b134d81b072676f4b466a"
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
