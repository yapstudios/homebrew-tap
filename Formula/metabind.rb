class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.47/metabind-darwin-arm64.tar.gz"
      sha256 "52c994bce17f2e4fb96d1ca495980379d1a6bd3e3c98dda5c1cdea5b8ac5ccee"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.47/metabind-darwin-x64.tar.gz"
      sha256 "3533e33b41dd130e22be9e7147be07d2a28aaf08cc1daa8f839b8f5279c93363"
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
    assert_match "0.7.47", shell_output("#{bin}/metabind --version")
  end
end
