class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.31/metabind-darwin-arm64.tar.gz"
      sha256 "8545aaa13abf3ea45db77df0eb50796d3464041a88ab8f0395e433c3a46a256f"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.31/metabind-darwin-x64.tar.gz"
      sha256 "deb28b11f03a929616d12e0b27c3b2212b82f3a0b089199254068bb30d42d7d3"
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
    assert_match "0.7.31", shell_output("#{bin}/metabind --version")
  end
end
