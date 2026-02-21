cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.12.0"

  if Hardware::CPU.arm?
    sha256 "729d95fabb78cde90ae736dab7ee68aaaea9bcf232a83e1c98dab86fbfa65293"
  else
    sha256 "f71ef2e9ea97e73b9a29749fc5e30f8755842a5935593082cdaa9a66bbbfc9e5"
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
