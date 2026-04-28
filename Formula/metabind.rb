class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.40/metabind-darwin-arm64.tar.gz"
      sha256 "7062e2a61d3aea593d21ce7ab94f0309303fd3e5eed77a0c9bdd777303ffa686"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.40/metabind-darwin-x64.tar.gz"
      sha256 "d40f7911dcab065d8d85ccaa36cc77150a744f6313cd2696903bd7987d2cf666"
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
    assert_match "0.7.40", shell_output("#{bin}/metabind --version")
  end
end
