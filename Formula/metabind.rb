class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.24/metabind-darwin-arm64.tar.gz"
      sha256 "1f977e1309a19150c22a2d51e1f43f12b22722a4db5dff00135a26442f40ca24"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.24/metabind-darwin-x64.tar.gz"
      sha256 "d8a1af68c9da82e1be173b3ad82597c7a183aab18039c6b4043f373a8f488a26"
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
    assert_match "0.6.24", shell_output("#{bin}/metabind --version")
  end
end
