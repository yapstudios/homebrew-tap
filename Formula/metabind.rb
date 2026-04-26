class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.50/metabind-darwin-arm64.tar.gz"
      sha256 "63c85cb30dc19b3e8a5adf7aab2ef5c7284d6bb737522a074491b68af622ea03"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.50/metabind-darwin-x64.tar.gz"
      sha256 "e6888b165367c2a71c8ebd8e3759fa62cb1743d40e25c84c937defbcc2b82c7a"
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
    assert_match "0.6.50", shell_output("#{bin}/metabind --version")
  end
end
