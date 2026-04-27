class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.24/metabind-darwin-arm64.tar.gz"
      sha256 "9d0c706424f7952f0bdb4a6a8904718286315e1ae633cad425209987d7f6d31f"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.24/metabind-darwin-x64.tar.gz"
      sha256 "973c7220fac29440a512c9ac6cf5d34d6b903d2add2e8cd48f68829d8482d3a3"
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
    assert_match "0.7.24", shell_output("#{bin}/metabind --version")
  end
end
