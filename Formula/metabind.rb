class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.4/metabind-darwin-arm64.tar.gz"
      sha256 "fa09cbdc6a00fc217624b5725c1b25a17c1365e89d5b2b19afa20d0da03a66aa"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.4/metabind-darwin-x64.tar.gz"
      sha256 "da0537e4e217dc65345510e12c96ade239d0a1ba2490c7f5632768ec4043712b"
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
    assert_match "0.7.4", shell_output("#{bin}/metabind --version")
  end
end
