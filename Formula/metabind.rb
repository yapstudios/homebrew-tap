class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.57/metabind-darwin-arm64.tar.gz"
      sha256 "247d2288ead2983ab6bd279c552b7338204cc93a4cf9b1b7b7432791a1cd048f"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.57/metabind-darwin-x64.tar.gz"
      sha256 "304224dd7490fc0ba4fab65bc86c47fd8e7d90e788c00546f340cb72eec25125"
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
    assert_match "0.7.57", shell_output("#{bin}/metabind --version")
  end
end
