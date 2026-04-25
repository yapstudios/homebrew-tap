class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.30/metabind-darwin-arm64.tar.gz"
      sha256 "fcbd6b854b666a5cee24c8b63d34dd6f7e7ed3cd2167bc43078b73fd35288738"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.30/metabind-darwin-x64.tar.gz"
      sha256 "e1aa39e31eaf3c2ca293d52a5858be607c67596ae240fb4e265bcc456551c109"
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
    assert_match "0.6.30", shell_output("#{bin}/metabind --version")
  end
end
