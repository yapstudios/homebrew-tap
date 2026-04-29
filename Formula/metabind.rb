class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.58"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.58/metabind-darwin-arm64.tar.gz"
      sha256 "694bf233f57ba9dc43f2eeefdb315f2a52bda266c6e473b9b566986b8ec21ce6"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.58/metabind-darwin-x64.tar.gz"
      sha256 "3a6a88e73d98481e012ce6810a821ee3296cf7f8682496ab6f4c5d38602b06e7"
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
    assert_match "0.7.58", shell_output("#{bin}/metabind --version")
  end
end
