class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.15/metabind-darwin-arm64.tar.gz"
      sha256 "f0bb10170d5a9971a7f5bd147a300413c1fbe91f6e05f49fb61c099166d7ec8c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.15/metabind-darwin-x64.tar.gz"
      sha256 "8861b04614f52c623d3f0dc688653af72604e74dbecc7dc6967601033f48bf75"
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
    assert_match "0.6.15", shell_output("#{bin}/metabind --version")
  end
end
