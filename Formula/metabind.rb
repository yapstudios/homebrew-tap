class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.37/metabind-darwin-arm64.tar.gz"
      sha256 "e3cc31743e7a8481ae06ec93a8ea63ea5c7fcdb465291be7685d23add4a3454e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.37/metabind-darwin-x64.tar.gz"
      sha256 "b7bccea17c7425d005a1fda90dbd58f3fd8b2d882c9f08a2bf7204d2d3817439"
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
    assert_match "0.7.37", shell_output("#{bin}/metabind --version")
  end
end
