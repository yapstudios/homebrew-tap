class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.23/metabind-darwin-arm64.tar.gz"
      sha256 "d0d470e8c5c31b402216ebe21ac184ffdade13ea95c9397bdcd4e524cafa9b86"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.23/metabind-darwin-x64.tar.gz"
      sha256 "1304b7c3c42b732046b9f03d1a277cfceed10de1296da10c00f24f8ff05a3feb"
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
    assert_match "0.8.23", shell_output("#{bin}/metabind --version")
  end
end
