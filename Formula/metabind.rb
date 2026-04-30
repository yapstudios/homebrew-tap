class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.1/metabind-darwin-arm64.tar.gz"
      sha256 "6e1a8c3b21cfcb008cd95df4bfe0180a82f16f7b8cc4f437294e6a12751022fa"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.1/metabind-darwin-x64.tar.gz"
      sha256 "a56ab048aab1eb127d1dbdf01d48cbc35dbb7d02dea2d6bd88db78f8ad9d457e"
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
    assert_match "0.8.1", shell_output("#{bin}/metabind --version")
  end
end
