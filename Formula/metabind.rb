class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.6/metabind-darwin-arm64.tar.gz"
      sha256 "9e307fa697056394ee44f3c2d3279c91e0338862df5e688a039bb07255adecde"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.6/metabind-darwin-x64.tar.gz"
      sha256 "6f3be688351b44877947b384b482bedf7b8b7b1a8ce4e75e6742b7a7b1a0f1a3"
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
    assert_match "0.7.6", shell_output("#{bin}/metabind --version")
  end
end
