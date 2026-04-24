class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.0/metabind-darwin-arm64.tar.gz"
      sha256 "0c51e102aff56a67735950537b41fe4d7be644eff7be0d934d9add71c85fd54a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.0/metabind-darwin-x64.tar.gz"
      sha256 "71b86847b9dcb53ea82dc07daaeaeae7bb75b767745e42fb296ef22edc842b0a"
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
    assert_match "0.6.0", shell_output("#{bin}/metabind --version")
  end
end
