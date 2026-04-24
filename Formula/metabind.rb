class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.3/metabind-darwin-arm64.tar.gz"
      sha256 "fc1449d48d48de039d430da78acd3eb17d46c33289042e6c28f721c4e65ad466"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.3/metabind-darwin-x64.tar.gz"
      sha256 "68fbc50fd7020d0469385fc6df59e6cf14a7447affc509afef1604df1d1044f9"
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
    assert_match "0.6.3", shell_output("#{bin}/metabind --version")
  end
end
