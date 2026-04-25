class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.23/metabind-darwin-arm64.tar.gz"
      sha256 "27e336e7e7aa797a446bf540083ad03106e881579afbb7ccedb733c962673d9a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.23/metabind-darwin-x64.tar.gz"
      sha256 "581038276bde04af002b47a8726e48cfbbe417978ea8ba8e73fa2d79c619eadb"
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
    assert_match "0.6.23", shell_output("#{bin}/metabind --version")
  end
end
