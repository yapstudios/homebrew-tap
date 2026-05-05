class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.28/metabind-darwin-arm64.tar.gz"
      sha256 "560f1943d0096549d0951b28249cb02b413ef55a40c52e63c02b158186308aaf"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.28/metabind-darwin-x64.tar.gz"
      sha256 "eaa90eb7196e32c54427f7ea5b092e6c189db50c699d750873f885ecc7dc1b23"
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
    assert_match "0.8.28", shell_output("#{bin}/metabind --version")
  end
end
