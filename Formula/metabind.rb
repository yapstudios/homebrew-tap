class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.25/metabind-darwin-arm64.tar.gz"
      sha256 "133d6a30da0b1fbd5585ce0123d5c72d072e65359cc98baee8fd66ed3c49aefb"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.25/metabind-darwin-x64.tar.gz"
      sha256 "9984d4d22f989539b9294ae1ec07ef55411106548d75ebe64da329d474ea8117"
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
    assert_match "0.6.25", shell_output("#{bin}/metabind --version")
  end
end
