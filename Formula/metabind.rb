class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.35/metabind-darwin-arm64.tar.gz"
      sha256 "6e35118504b0d34650df5df822365de3e2efea49ec97f9d4cb421d284ced0eda"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.35/metabind-darwin-x64.tar.gz"
      sha256 "e9a3c700ab33c45addf7d8adf78fa8b83e11db01cae8029731fa5c610ececa80"
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
    assert_match "0.6.35", shell_output("#{bin}/metabind --version")
  end
end
