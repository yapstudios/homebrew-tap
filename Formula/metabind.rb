class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.8/metabind-darwin-arm64.tar.gz"
      sha256 "4d41d47c0406c950901171fd21b7d5c27246a0a6dd16960b73e2d76278764f02"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.8/metabind-darwin-x64.tar.gz"
      sha256 "efd8dd442440b741b93f6477eb7075e34725dcb78cce2ab8b952ee8ab5ccd782"
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
    assert_match "0.7.8", shell_output("#{bin}/metabind --version")
  end
end
