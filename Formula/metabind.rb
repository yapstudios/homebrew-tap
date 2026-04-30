class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.9/metabind-darwin-arm64.tar.gz"
      sha256 "2f9458c3317523df6712ca52355a894242f09e072f7500c937f94ff18bd1ee9e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.9/metabind-darwin-x64.tar.gz"
      sha256 "b0c142b97670e9a340ece434e39699009c00a2b40c85124b1efee675b0324ddf"
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
    assert_match "0.8.9", shell_output("#{bin}/metabind --version")
  end
end
