class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.9/metabind-darwin-arm64.tar.gz"
      sha256 "c54c4d367617854cb038c48876610129ee83232ff257b1c69780d8af066cdca0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.9/metabind-darwin-x64.tar.gz"
      sha256 "61284dfc94d86a3bc69114543e6125dae4af9f259c984bdbca2c3b85431fbf73"
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
    assert_match "0.7.9", shell_output("#{bin}/metabind --version")
  end
end
