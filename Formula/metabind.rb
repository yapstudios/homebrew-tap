class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.33/metabind-darwin-arm64.tar.gz"
      sha256 "26e087d0a341e3e1de41f4d27ba0038e974b953be00dab0c75df47d99b3ba1cd"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.33/metabind-darwin-x64.tar.gz"
      sha256 "6629f627df2bef8bd64519dfc6ee3c9cdd5b28721001d1917d62978e51cc92a3"
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
    assert_match "0.7.33", shell_output("#{bin}/metabind --version")
  end
end
