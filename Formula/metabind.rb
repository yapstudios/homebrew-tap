class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.8/metabind-darwin-arm64.tar.gz"
      sha256 "7fb9d22b0a0ce9375e7937e90c5a1d1bfa9b53f290114337b2527e2aa2dc7d21"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.8/metabind-darwin-x64.tar.gz"
      sha256 "56cbf73ed1d97d442571a40e03c54e8391efc24d4bcdc42df5b59edab0a840bf"
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
    assert_match "0.8.8", shell_output("#{bin}/metabind --version")
  end
end
