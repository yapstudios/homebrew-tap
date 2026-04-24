class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.4/metabind-darwin-arm64.tar.gz"
      sha256 "79b6254ead73e1478336f02b505442e252184182177273eeea0848b096f83958"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.4/metabind-darwin-x64.tar.gz"
      sha256 "0dbd23378ce5808c0019e4a244b23f7f361917db69e18e4957c18c5a26bc38ba"
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
    assert_match "0.6.4", shell_output("#{bin}/metabind --version")
  end
end
