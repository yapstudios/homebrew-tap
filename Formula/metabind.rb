class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.30/metabind-darwin-arm64.tar.gz"
      sha256 "adcd4feab79418ec87bf678aa40c342e7ecd19e23ff2a89966179b34fcabd870"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.30/metabind-darwin-x64.tar.gz"
      sha256 "e93592cc05e820379d99564879c25da27907e0cedd1efce8722fad304553e0b8"
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
    assert_match "0.8.30", shell_output("#{bin}/metabind --version")
  end
end
