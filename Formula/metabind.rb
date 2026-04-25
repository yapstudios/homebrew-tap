class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.26/metabind-darwin-arm64.tar.gz"
      sha256 "6a1647b56c193f990ebc05e34ef7c5bb3c66faf63992094a52bc1f739411f0b8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.26/metabind-darwin-x64.tar.gz"
      sha256 "bdead5f7c791f0d8cecfae0004f5ee2538667a7eb8a7fa710026a21670473da2"
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
    assert_match "0.6.26", shell_output("#{bin}/metabind --version")
  end
end
