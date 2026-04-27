class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.29/metabind-darwin-arm64.tar.gz"
      sha256 "2c8dd27821935cfcab12d66b677a8381e21609a87157444676f8f01e51103865"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.29/metabind-darwin-x64.tar.gz"
      sha256 "910af2e3dacb80c4181876a9b56909e386e1e233f724c179230045ec7ac0ccef"
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
    assert_match "0.7.29", shell_output("#{bin}/metabind --version")
  end
end
