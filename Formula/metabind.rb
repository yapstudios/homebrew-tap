class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.28/metabind-darwin-arm64.tar.gz"
      sha256 "3986a872e48275604a77c69d9773939d7cc414933dde1bbf26082789bb4db7cf"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.28/metabind-darwin-x64.tar.gz"
      sha256 "9f417683b166038dd628bca60e4122663f86dc33906913bee789752cfac82db0"
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
    assert_match "0.7.28", shell_output("#{bin}/metabind --version")
  end
end
