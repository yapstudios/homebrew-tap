class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.29"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.29/metabind-darwin-arm64.tar.gz"
      sha256 "8e08ca1f74da0b00dafa3ee5c3257144d2f6cae6f0d458c99bcb01f67dd8be48"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.29/metabind-darwin-x64.tar.gz"
      sha256 "d018f97590773afa9b59573a608bdc9e8e1c79354f2a80c3e917ced48bf1f567"
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
    assert_match "0.8.29", shell_output("#{bin}/metabind --version")
  end
end
