class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.47"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.47/metabind-darwin-arm64.tar.gz"
      sha256 "6df36e75f2eeecbc0af3332226f15cfbc149c779dc35713c0f5f94af0052df3e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.47/metabind-darwin-x64.tar.gz"
      sha256 "2208d76305182aceb0faf3a7e79e1da954d8f6e9fd7a16a495cbb4524e9d8e24"
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
    assert_match "0.6.47", shell_output("#{bin}/metabind --version")
  end
end
