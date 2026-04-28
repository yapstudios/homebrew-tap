class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.38/metabind-darwin-arm64.tar.gz"
      sha256 "14220cbaf07ae4824e403f3ed90e832bb53b115fed281a8db055466b7badbbeb"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.38/metabind-darwin-x64.tar.gz"
      sha256 "025686bfc90f2f5ebe62d85d95e8aba91f74060b356758dcfd1d4d853e122ba9"
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
    assert_match "0.7.38", shell_output("#{bin}/metabind --version")
  end
end
