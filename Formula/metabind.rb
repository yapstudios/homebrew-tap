class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.56"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.56/metabind-darwin-arm64.tar.gz"
      sha256 "6330e89235c742facb3ce2c336c5be3dc5cb4af017123b77ded78f028f4ad8b0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.56/metabind-darwin-x64.tar.gz"
      sha256 "711e746d95d75c5331698014097eed753a57bbffd3b3008ceb58537992cb4bfc"
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
    assert_match "0.7.56", shell_output("#{bin}/metabind --version")
  end
end
