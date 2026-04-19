cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.25.1"

  if Hardware::CPU.arm?
    sha256 "9793fbf9f325fb8f625bbe167d369b2def9188525435e559bc4ff2a311a8e314"
  else
    sha256 "00388febf414c7e4638b0401b37d1d945ca6a04f1feb92d880452be40f04c999"
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
