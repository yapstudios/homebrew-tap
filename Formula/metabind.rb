class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.36/metabind-darwin-arm64.tar.gz"
      sha256 "e728313822bb6e4685a0956ec6b038713a924dacfe699ff9ad74023f9332aec3"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.36/metabind-darwin-x64.tar.gz"
      sha256 "610a059f4293fc924cb9020ab752dd87cd56c6cb5b0d562a87db40db9068842f"
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
    assert_match "0.7.36", shell_output("#{bin}/metabind --version")
  end
end
