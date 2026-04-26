class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.37/metabind-darwin-arm64.tar.gz"
      sha256 "f5dc1db79fabd13085711fae83995fdd6e73f14c2422e930d9e9b24aca5579ad"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.37/metabind-darwin-x64.tar.gz"
      sha256 "00d9e55f502e758a523ff914fff7f30e013c98905f14e61e90e47e18b1fef38c"
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
    assert_match "0.6.37", shell_output("#{bin}/metabind --version")
  end
end
