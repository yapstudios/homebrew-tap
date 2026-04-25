class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.28"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.28/metabind-darwin-arm64.tar.gz"
      sha256 "41f900349df6844efd1b80def774aa3e5039994f9d2c3fe78e1065ac2b9e82ef"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.28/metabind-darwin-x64.tar.gz"
      sha256 "0a8a63068a9b32b8350b950d74d83156155a965b06b5254335efa273444bb648"
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
    assert_match "0.6.28", shell_output("#{bin}/metabind --version")
  end
end
