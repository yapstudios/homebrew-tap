class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.10/metabind-darwin-arm64.tar.gz"
      sha256 "0dbfeb9e426021a78f06c833585c769ae20bb130c632ced474ec056d0780fa7e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.10/metabind-darwin-x64.tar.gz"
      sha256 "e1200e4be9df1ec4a1c1fa67791f1b0ee9259c22fe4ef5d84c2ba4e1e1667d4c"
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
    assert_match "0.6.10", shell_output("#{bin}/metabind --version")
  end
end
