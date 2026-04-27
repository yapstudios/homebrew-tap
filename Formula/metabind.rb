class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.14/metabind-darwin-arm64.tar.gz"
      sha256 "221897142c48c553f4a7d120944b8961fc3ca84300e9849ac52456082a97ad66"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.14/metabind-darwin-x64.tar.gz"
      sha256 "b26caf0814b76362d469ea2a0c76723605d0c2269b36d5577badb06bdf7c5cd7"
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
    assert_match "0.7.14", shell_output("#{bin}/metabind --version")
  end
end
