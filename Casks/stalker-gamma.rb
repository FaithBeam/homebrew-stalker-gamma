cask "stalker-gamma" do
  arch arm: "arm64", intel: "x64"

  version "1.14.0"

  if Hardware::CPU.arm?
    sha256 "fee48a4b9116487dfea333e674241a297ca816934675d880f799377ba2104ce4"
  else
    sha256 "ec5a5f344ce4949eb1eb9eb0dfa66318192c9413c24ef7bc405eaaf2ac44aa3b"
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
