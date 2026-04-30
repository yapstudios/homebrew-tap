class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.0/metabind-darwin-arm64.tar.gz"
      sha256 "ae58720a62e0ce37ea0f7fdb39de46a6169592ca3c84c1bb5a4d46b9c3e83fc0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.0/metabind-darwin-x64.tar.gz"
      sha256 "0dbd79926ef2e7bb7e93b3f2a0561469fe4307e32d7b9520ae2875723f9f64f0"
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
    assert_match "0.8.0", shell_output("#{bin}/metabind --version")
  end
end
