class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.18/metabind-darwin-arm64.tar.gz"
      sha256 "d2cbe2c0543495c22ddbc100df8d7c55cd1188cac5f20805ce0630ce2a55c15b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.18/metabind-darwin-x64.tar.gz"
      sha256 "38fba61e942effe236b8d590afa00b0675f426c0e49f617094f99f6fc97f73ec"
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
    assert_match "0.7.18", shell_output("#{bin}/metabind --version")
  end
end
