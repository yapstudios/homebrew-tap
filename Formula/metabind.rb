class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.65"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.65/metabind-darwin-arm64.tar.gz"
      sha256 "228ee54cd8653cb59d2a4e57eeb923ad15b3f27a3aa9c1247167a0531f54f0b9"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.65/metabind-darwin-x64.tar.gz"
      sha256 "a57b146a6700c7ed41a8e50e4438735cbcf828f04f01275c56d500434a7a1156"
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
    assert_match "0.7.65", shell_output("#{bin}/metabind --version")
  end
end
