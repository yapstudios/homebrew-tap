class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.35/metabind-darwin-arm64.tar.gz"
      sha256 "c898a927f909c839ca5fcd90b1a596800d43cf8c888629fcea94946790f7c923"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.35/metabind-darwin-x64.tar.gz"
      sha256 "662e9bb10a2a9371c1d4a56b378ccb393fa6c85d60480ba6f5296c497616655b"
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
    assert_match "0.8.35", shell_output("#{bin}/metabind --version")
  end
end
