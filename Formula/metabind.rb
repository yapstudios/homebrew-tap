class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.29/metabind-darwin-arm64.tar.gz"
      sha256 "9ea24c05d40d9213af710a620ca44ce9f511b8b35398b14d62d0e12a62f6b89c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.29/metabind-darwin-x64.tar.gz"
      sha256 "000526ecfabb60eaa78fec437b4fff18e0a6f8fe04e7e7d83b9902d7511ba2e8"
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
    assert_match "0.6.29", shell_output("#{bin}/metabind --version")
  end
end
