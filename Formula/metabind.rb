class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.53/metabind-darwin-arm64.tar.gz"
      sha256 "45d561f613affd6a95541044206ffa1258dd57b2d75d49a13c6cdd7accfa3fe5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.53/metabind-darwin-x64.tar.gz"
      sha256 "c97b4cc650c53bda97949eba82afd3d4af15f373c8818f3fdff5a6e01c0dc126"
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
    assert_match "0.7.53", shell_output("#{bin}/metabind --version")
  end
end
