class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.26"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.26/metabind-darwin-arm64.tar.gz"
      sha256 "03b6a2528ab84b64e895bd0476bc43efa1ee6129630c67841ba432d68d910593"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.26/metabind-darwin-x64.tar.gz"
      sha256 "1caf1778b4fa3ce74f822c8a277b389a0e5272252a07f52721af029f2239eabe"
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
    assert_match "0.7.26", shell_output("#{bin}/metabind --version")
  end
end
