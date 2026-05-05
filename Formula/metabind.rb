class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.36/metabind-darwin-arm64.tar.gz"
      sha256 "86ae95fd09d30aeb1cc7bfb8cb54cf611c07d115ca96f181a9fc8fcce9699d7c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.36/metabind-darwin-x64.tar.gz"
      sha256 "3ccb755b2ede10723a63972871375549f5898b16216d5a2d2b53d274b4d567c0"
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
    assert_match "0.8.36", shell_output("#{bin}/metabind --version")
  end
end
