class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.34/metabind-darwin-arm64.tar.gz"
      sha256 "3ddcde8430fcb3ddf896b3ee8a41fa15b3e1c809eeab31dd1777635925a808c1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.34/metabind-darwin-x64.tar.gz"
      sha256 "622da9ed9302ed726b3d2d82727d76ad53c21b5add63ea5e321078d53f8e351f"
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
    assert_match "0.8.34", shell_output("#{bin}/metabind --version")
  end
end
