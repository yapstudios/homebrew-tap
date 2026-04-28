class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.35/metabind-darwin-arm64.tar.gz"
      sha256 "433a680e7f9e4d7198efb55ccfd32190a2b1f2c5a80a85efb8874d5b46952f1b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.35/metabind-darwin-x64.tar.gz"
      sha256 "79d377aff906930ea6ccde4b0f8b5f476844f7a6378cb81141001449b4cac3fe"
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
    assert_match "0.7.35", shell_output("#{bin}/metabind --version")
  end
end
