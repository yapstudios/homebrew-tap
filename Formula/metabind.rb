class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.12/metabind-darwin-arm64.tar.gz"
      sha256 "8d511013919eee80a7db9dcf1df122b979a0e31d228cd5c909b31b3dad304d1e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.12/metabind-darwin-x64.tar.gz"
      sha256 "ea27d158742c5c99772206e700d2430887b33fecba44eff8016375215e0a0097"
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
    assert_match "0.6.12", shell_output("#{bin}/metabind --version")
  end
end
