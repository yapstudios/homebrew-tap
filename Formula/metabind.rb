class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.53"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.53/metabind-darwin-arm64.tar.gz"
      sha256 "25ff20f686d3922e98e4645e79efc44ff7f54d65ed26fd7ce30667ab49a1c840"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.53/metabind-darwin-x64.tar.gz"
      sha256 "f6c45add1dbdfb52705ccbf13a59a5391569fee15bd6e3f67ddd167d27b98d5e"
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
    assert_match "0.6.53", shell_output("#{bin}/metabind --version")
  end
end
