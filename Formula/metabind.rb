class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.21/metabind-darwin-arm64.tar.gz"
      sha256 "de393c9c7263fde0b3ba6c72a7f7e67710f23eabe715ad96f380dd4462cd0bf2"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.21/metabind-darwin-x64.tar.gz"
      sha256 "e7f0ad2f4dde106e057cb850a4be957cf30a9fa891f2a1b97c9ff99570677cc9"
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
    assert_match "0.8.21", shell_output("#{bin}/metabind --version")
  end
end
