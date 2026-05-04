class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.26/metabind-darwin-arm64.tar.gz"
      sha256 "7ff121b373df8e038a69e1803ccb875cd2f555b8aac693bfe45b3a49dd78adf1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.26/metabind-darwin-x64.tar.gz"
      sha256 "d83d2dcda941ce058c954ce197eba757bbf4f9199a2984bbee8579813bb7ab8d"
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
    assert_match "0.8.26", shell_output("#{bin}/metabind --version")
  end
end
