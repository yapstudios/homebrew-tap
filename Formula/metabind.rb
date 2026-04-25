class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.33/metabind-darwin-arm64.tar.gz"
      sha256 "354d71750c66914942e078923f9b4f39fb9314ed166fd3b6a9ff37473c6a4cb1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.33/metabind-darwin-x64.tar.gz"
      sha256 "fe6b158d9de96772b6c63e38077346d0106022784c56e67e43ffe934c9ae3390"
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
    assert_match "0.6.33", shell_output("#{bin}/metabind --version")
  end
end
