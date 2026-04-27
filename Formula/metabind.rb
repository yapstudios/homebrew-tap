class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.7/metabind-darwin-arm64.tar.gz"
      sha256 "e8dbb6703b95e840c603dc93ce98fc49c71511ba47ae4d85ddee716e3286c520"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.7/metabind-darwin-x64.tar.gz"
      sha256 "2ecf61ad496048feeb8a9fa13f7b37418ae1f135a3f28875f00aede215e8df80"
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
    assert_match "0.7.7", shell_output("#{bin}/metabind --version")
  end
end
