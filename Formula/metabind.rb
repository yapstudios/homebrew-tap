class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.42/metabind-darwin-arm64.tar.gz"
      sha256 "f487d5cc6b3bc027576af1dbc64cd9de57d56ed797587300605e5966680e56ea"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.42/metabind-darwin-x64.tar.gz"
      sha256 "e67f0f394763559b6d5b66638a8fbd12e3d229e177dbf5a9b0360d4aaafa2684"
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
    assert_match "0.6.42", shell_output("#{bin}/metabind --version")
  end
end
