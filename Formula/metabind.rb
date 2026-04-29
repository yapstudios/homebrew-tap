class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.62"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.62/metabind-darwin-arm64.tar.gz"
      sha256 "672db0c9e9ec48ad4fedfdb845964d4c76f0d39cc3fb83207a52f5f6481026a3"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.62/metabind-darwin-x64.tar.gz"
      sha256 "4e0939ead2812d15578fa7cc0e56097c12cfb22139fba91026a31da1ce0fc862"
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
    assert_match "0.7.62", shell_output("#{bin}/metabind --version")
  end
end
