class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.39/metabind-darwin-arm64.tar.gz"
      sha256 "8b0d08c6cc35c308c3701d8e75090e7e05f781f2f74610e442aac09f033033ac"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.39/metabind-darwin-x64.tar.gz"
      sha256 "f76877d4bdf2e6167df3b1e4c9d78ef653ffc275de6c42e5aa02c56acfcf6279"
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
    assert_match "0.6.39", shell_output("#{bin}/metabind --version")
  end
end
