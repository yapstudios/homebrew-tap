class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.12/metabind-darwin-arm64.tar.gz"
      sha256 "997ffc74776ffbd8c535193b75a2b2b60367dc20c5ef4332a7cd270a3aacdb5f"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.12/metabind-darwin-x64.tar.gz"
      sha256 "bcb51ebccefb5d694db19bb3710c8e06947d157a9df1c3baddbf0c9152741d3d"
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
    assert_match "0.7.12", shell_output("#{bin}/metabind --version")
  end
end
