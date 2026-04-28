class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.44/metabind-darwin-arm64.tar.gz"
      sha256 "48da9b4c3a1efb5382588fa1088b64661fed001af11b37fb11cd8e0ec6600f56"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.44/metabind-darwin-x64.tar.gz"
      sha256 "cf11aaf16f4b6967669b51062dc63cc827c9cc86a7918b17bd938902ecea48cd"
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
    assert_match "0.7.44", shell_output("#{bin}/metabind --version")
  end
end
