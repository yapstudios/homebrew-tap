class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.13/metabind-darwin-arm64.tar.gz"
      sha256 "8501d304a20db7953f8f756dcd7d0d08f4611b24c74423cbc8beddc40b882592"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.13/metabind-darwin-x64.tar.gz"
      sha256 "38f1df357234e6977b42034327d71cd35bdc3367cb3d7f33644ae97fbe6f8eaf"
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
    assert_match "0.7.13", shell_output("#{bin}/metabind --version")
  end
end
