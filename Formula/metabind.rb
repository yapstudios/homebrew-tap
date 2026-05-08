class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.40/metabind-darwin-arm64.tar.gz"
      sha256 "16234ccfd816bab9d89208f340a63bd614abfe661a266789065ba4dfb554e78e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.40/metabind-darwin-x64.tar.gz"
      sha256 "f89384a50fa4f0eb48c1f4a4af73a8f9cea4f16b3e62da04d59bcc73a12a37ca"
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
    assert_match "0.8.40", shell_output("#{bin}/metabind --version")
  end
end
