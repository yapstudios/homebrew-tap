class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.13/metabind-darwin-arm64.tar.gz"
      sha256 "ec25480558712948f11c847cdb934a7ca4d625bfdadef68b4a784dad4ccced9a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.13/metabind-darwin-x64.tar.gz"
      sha256 "ccf8e822e24be2c9eb54a2cf00652f4860da9b143a2e6f58e638fdd7c90e1bef"
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
    assert_match "0.8.13", shell_output("#{bin}/metabind --version")
  end
end
