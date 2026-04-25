class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.21/metabind-darwin-arm64.tar.gz"
      sha256 "1a9a63530e639a9df9575d93cf80c2dc95db7b050484779446fccf1b13798c27"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.21/metabind-darwin-x64.tar.gz"
      sha256 "c5f2f4fe46a02a2837818cee75a41c4af3faf4bfa84658f13b241d4ea2c6b71b"
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
    assert_match "0.6.21", shell_output("#{bin}/metabind --version")
  end
end
