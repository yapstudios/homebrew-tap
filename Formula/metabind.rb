class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.1/metabind-darwin-arm64.tar.gz"
      sha256 "8ed02ce75ed0955a6b09cb357841ed1e42f2537cbf2636b526495f98f61e54d0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.1/metabind-darwin-x64.tar.gz"
      sha256 "b4a2663511d0325e5923f3fa4b8787933170c361c05b88f931a67b7811a5aadd"
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
    assert_match "0.6.1", shell_output("#{bin}/metabind --version")
  end
end
