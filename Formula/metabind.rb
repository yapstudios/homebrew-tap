class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.59"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.59/metabind-darwin-arm64.tar.gz"
      sha256 "b8ada7dfd20ccd34ccce13938b8bdb53d2359f8ab8c6250dad58c0173063f13b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.59/metabind-darwin-x64.tar.gz"
      sha256 "481ca32ab5cc3944933212e5dca26d0ea2c25f3ac54cef05fa59c287b7d418d9"
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
    assert_match "0.7.59", shell_output("#{bin}/metabind --version")
  end
end
