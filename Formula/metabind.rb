class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.48/metabind-darwin-arm64.tar.gz"
      sha256 "9b46629015dd721eaba6f0d89e09b780c3cc633602bf0ace28f0ac3084011fd9"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.48/metabind-darwin-x64.tar.gz"
      sha256 "24f74d0e0377976fce605361eb672090b6e572b6fff08bd0422c6b74aff6eb8c"
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
    assert_match "0.7.48", shell_output("#{bin}/metabind --version")
  end
end
