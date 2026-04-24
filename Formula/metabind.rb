class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.8/metabind-darwin-arm64.tar.gz"
      sha256 "9238edd26cff362071cfe5d6170e36a4d8631f14ef9dfc5083fd78ade2e0d0a5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.8/metabind-darwin-x64.tar.gz"
      sha256 "d07960cba01c68938e2e0839cad4df721417633db62cc55e939fd730f82fb345"
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
    assert_match "0.6.8", shell_output("#{bin}/metabind --version")
  end
end
