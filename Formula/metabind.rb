class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.14/metabind-darwin-arm64.tar.gz"
      sha256 "0ae69d89c4321f8b7f6f667d860cba0745190a532cb60b53df8a2cb1e40cdc29"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.14/metabind-darwin-x64.tar.gz"
      sha256 "4f11dec4154ba95ebf93217e7e184b80ec162505f4078393d446a8ceeda149dd"
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
    assert_match "0.6.14", shell_output("#{bin}/metabind --version")
  end
end
