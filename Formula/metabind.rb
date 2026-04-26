class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.51/metabind-darwin-arm64.tar.gz"
      sha256 "4f40dbcd66413299584257bd71bc51408695e0f3dcf50fa4f320c5b4ec709942"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.51/metabind-darwin-x64.tar.gz"
      sha256 "3cd62b2474c626129685e149fa97c0f0ac6b010fb5dd2cdf9649932adf704ac4"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "metabind-darwin-arm64" => "metabind"
    else
      bin.install "metabind-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.6.51", shell_output("#{bin}/metabind --version")
  end
end
