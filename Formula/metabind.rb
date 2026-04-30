class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.2/metabind-darwin-arm64.tar.gz"
      sha256 "33de935fc82d934969b19b28f97c18a0c0d3142b60c5db68cb2a9a9399a2b884"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.2/metabind-darwin-x64.tar.gz"
      sha256 "cd5c8f168fa45f6a7c48a0756bc9069a2099d50bd10582a3491e1966f869d3f0"
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
    assert_match "0.8.2", shell_output("#{bin}/metabind --version")
  end
end
