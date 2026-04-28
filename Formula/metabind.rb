class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.54"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.54/metabind-darwin-arm64.tar.gz"
      sha256 "b58139a5770a55bb1b2e524a9c08dfc2b4d1affa327cbf81f96f0eca6f804bc7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.54/metabind-darwin-x64.tar.gz"
      sha256 "50d5b5b360d2bc17979fe1a20eba473134f7d0aa0b1102cef245b59fe3cbe98d"
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
    assert_match "0.7.54", shell_output("#{bin}/metabind --version")
  end
end
