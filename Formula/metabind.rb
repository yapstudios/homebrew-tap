class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.10/metabind-darwin-arm64.tar.gz"
      sha256 "0b829850ab25c44098318de16531944398638d8e4c6e46fad8e8279e48122075"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.10/metabind-darwin-x64.tar.gz"
      sha256 "95c364cd8197e4494c804d7182c5f034e14359fabb28c5ccb737aefc8a4b88f3"
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
    assert_match "0.8.10", shell_output("#{bin}/metabind --version")
  end
end
