class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.32/metabind-darwin-arm64.tar.gz"
      sha256 "3ac5e2030f449b0ebd38c8d588b2789ae4226b53e7c3983f44807843cb4b41f3"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.32/metabind-darwin-x64.tar.gz"
      sha256 "9086785e2263f4e5f751d9ee7f14560e0aa701208fb3d6ac33f2d82606a915bc"
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
    assert_match "0.7.32", shell_output("#{bin}/metabind --version")
  end
end
