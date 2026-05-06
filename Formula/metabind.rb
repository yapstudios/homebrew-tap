class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.38"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.38/metabind-darwin-arm64.tar.gz"
      sha256 "d1df9c229f6f8fe95199479993d13d4295977d795459be35d733d7bcff26729d"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.38/metabind-darwin-x64.tar.gz"
      sha256 "023a45dd1033e58da5a753a37323fd0c5ac99dea34ad9ba960991b00eed74fb5"
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
    assert_match "0.8.38", shell_output("#{bin}/metabind --version")
  end
end
