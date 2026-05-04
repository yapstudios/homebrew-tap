class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.25/metabind-darwin-arm64.tar.gz"
      sha256 "fd09ed6bc8290e24edade6bfb1e680d9305c4ecc7acfd77572f3b306c6a327c6"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.25/metabind-darwin-x64.tar.gz"
      sha256 "c45adf84e0905489e8e9eeb3e8b95f2d99be230c52aa7ddd5d8e88eeb44b49c0"
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
    assert_match "0.8.25", shell_output("#{bin}/metabind --version")
  end
end
