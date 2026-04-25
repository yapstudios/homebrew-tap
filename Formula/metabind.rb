class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.32/metabind-darwin-arm64.tar.gz"
      sha256 "b7389204e5e7a89dd55a09608617597e2aa78acd5eba782fbdf6873acc002e08"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.32/metabind-darwin-x64.tar.gz"
      sha256 "c8c0237e28c5486c2bfd62010deaec0b3eb7ae538041493369fdf520083302df"
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
    assert_match "0.6.32", shell_output("#{bin}/metabind --version")
  end
end
