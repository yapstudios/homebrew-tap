class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.11/metabind-darwin-arm64.tar.gz"
      sha256 "d413e13736a9f0022f8e340833ef45df1eb4942119f03f564f38b03a3c97686b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.11/metabind-darwin-x64.tar.gz"
      sha256 "173bfa88bb533899bdc2a3d8287725407ebf969ee61175f922407765d2db39ff"
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
    assert_match "0.6.11", shell_output("#{bin}/metabind --version")
  end
end
