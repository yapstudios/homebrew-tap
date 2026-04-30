class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.6/metabind-darwin-arm64.tar.gz"
      sha256 "84a05ea91b17a6e611629847cfe0aa54a70efff53ac84b33a380aad323a0be33"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.6/metabind-darwin-x64.tar.gz"
      sha256 "6aa95609454755fa6970a5fe353ff4872a303c3da363ee7b3b3e811b40a124c6"
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
    assert_match "0.8.6", shell_output("#{bin}/metabind --version")
  end
end
