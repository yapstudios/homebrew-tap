class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.20/metabind-darwin-arm64.tar.gz"
      sha256 "ae1520262e6851088569e940f0b9ede6fc1cb123c08d3197f88ef757f33ccd53"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.20/metabind-darwin-x64.tar.gz"
      sha256 "8c6b0cc47c899653e8d9478cefeb2c6777f3e59bf384d8992f14aba52419f892"
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
    assert_match "0.7.20", shell_output("#{bin}/metabind --version")
  end
end
