class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.36/metabind-darwin-arm64.tar.gz"
      sha256 "927c7ecd90658ff87a12a256dee9ef5f2eb1c706692142c12ae51a1a293308b1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.36/metabind-darwin-x64.tar.gz"
      sha256 "a00cc0e46f192a2011aae330fc0ed228849eb19f09a3b1cdde3c3915b00592ec"
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
    assert_match "0.6.36", shell_output("#{bin}/metabind --version")
  end
end
