class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.38/metabind-darwin-arm64.tar.gz"
      sha256 "b97192ba4bff52d051bf7be8647edc78c728c64bdd751dcc6b57b81b8ac70bd7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.38/metabind-darwin-x64.tar.gz"
      sha256 "aed127a19523c01c105571c371e00bc08beeca92c0828be292893a48e05fb597"
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
    assert_match "0.6.38", shell_output("#{bin}/metabind --version")
  end
end
