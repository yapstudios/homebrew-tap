class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.15/metabind-darwin-arm64.tar.gz"
      sha256 "bd9d801c3010908e58367ad6c70723b663b9299c9d6cf453022194904ead183c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.15/metabind-darwin-x64.tar.gz"
      sha256 "9b2eee9cd871e8ff551be3f1d3f6a08beba1584580af1a50e2b8fe83c1d48b39"
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
    assert_match "0.7.15", shell_output("#{bin}/metabind --version")
  end
end
