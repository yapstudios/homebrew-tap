class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.9/metabind-darwin-arm64.tar.gz"
      sha256 "c033f96f735a45e4b05ea90d6411f06a7b715587c01064dbfffc28387e15531c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.9/metabind-darwin-x64.tar.gz"
      sha256 "826609d2312dcbf5448c512338e1e63a688a3a38fdf7d228be3d37b4901f8c98"
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
    assert_match "0.6.9", shell_output("#{bin}/metabind --version")
  end
end
