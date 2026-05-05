class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.32/metabind-darwin-arm64.tar.gz"
      sha256 "bc1f219c91175d2cf1ab301ae7f8dc6c49798a2f8810ed93ef9484657b2ddf17"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.32/metabind-darwin-x64.tar.gz"
      sha256 "c259d0d64b38d8132525ee667a077e621b7bc04e47530bbcd19d114c0e22ddf9"
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
    assert_match "0.8.32", shell_output("#{bin}/metabind --version")
  end
end
