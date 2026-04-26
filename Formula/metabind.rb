class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.40/metabind-darwin-arm64.tar.gz"
      sha256 "03f019a089fd41067e42d1aac2eeb483aee45e666f2df52f4520f8f8bacb4f8a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.40/metabind-darwin-x64.tar.gz"
      sha256 "eb226345c58ee3cf9496bc468aa4b9d3ee2c7380f6f4e1440e40504c852b44d0"
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
    assert_match "0.6.40", shell_output("#{bin}/metabind --version")
  end
end
