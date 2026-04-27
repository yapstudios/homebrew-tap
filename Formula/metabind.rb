class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.30/metabind-darwin-arm64.tar.gz"
      sha256 "251c6d6bad294617e45f276978af5cacfb55af30533a986a50ad64490f101c5a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.30/metabind-darwin-x64.tar.gz"
      sha256 "ef65c87bcce832a8ab253f90fb5066921fd84229d7971e999a3c78251d88d762"
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
    assert_match "0.7.30", shell_output("#{bin}/metabind --version")
  end
end
