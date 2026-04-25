class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.17/metabind-darwin-arm64.tar.gz"
      sha256 "e737aeaaab57e220e42796887da5bfc45f999a1d231cb150dd2ba98908446d45"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.17/metabind-darwin-x64.tar.gz"
      sha256 "23975b878c80bff73b2370ecdf879a8f3d2cc0f446a94266c0985e20a141a4bb"
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
    assert_match "0.6.17", shell_output("#{bin}/metabind --version")
  end
end
