class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.31/metabind-darwin-arm64.tar.gz"
      sha256 "1c6a52647270c715db1b27618dd1e09c87bb0c85744a321bd84308df2d61bce5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.31/metabind-darwin-x64.tar.gz"
      sha256 "0c5368ca1c0abc46d77703b8906b21b3b17bfa921f2d310d9c4cf5ae3c6db514"
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
    assert_match "0.8.31", shell_output("#{bin}/metabind --version")
  end
end
