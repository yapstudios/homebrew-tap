class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.16/metabind-darwin-arm64.tar.gz"
      sha256 "83fb11c558520692f70829ff6ccbf619e1179b8c9aadf234758ca9373d06b281"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.16/metabind-darwin-x64.tar.gz"
      sha256 "50ee0bbc79fdd0478d602a260260633c62188d1cb50502bd35ff59d285b25f18"
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
    assert_match "0.8.16", shell_output("#{bin}/metabind --version")
  end
end
