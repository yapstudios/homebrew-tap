class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.17/metabind-darwin-arm64.tar.gz"
      sha256 "6c2ca9544a128a3b887bb0517f23a270bdc7fe593ab21f74f584b1f3394b3ed4"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.17/metabind-darwin-x64.tar.gz"
      sha256 "ce1c905ff857e00decafe0628d782491f019d3ad41cf989a6d968840c8caa836"
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
    assert_match "0.7.17", shell_output("#{bin}/metabind --version")
  end
end
