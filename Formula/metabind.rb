class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.18/metabind-darwin-arm64.tar.gz"
      sha256 "1dd00082797f96be300b3cff3b9a219935acbe22ceccee95cd11906351484ee2"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.18/metabind-darwin-x64.tar.gz"
      sha256 "fa00009578046364d6bfd7e6077895a5811f2858f33f094c39561a8cc40226e8"
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
    assert_match "0.8.18", shell_output("#{bin}/metabind --version")
  end
end
