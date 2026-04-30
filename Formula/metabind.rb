class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.5/metabind-darwin-arm64.tar.gz"
      sha256 "a7f194b6bb00c45156619f0c8d3bed3e02873edd8eacec6384e2782a1bf43d4b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.5/metabind-darwin-x64.tar.gz"
      sha256 "9195b7fc1cb03b0e81956a951e48c5231ff5302138fdd0ef49004bbbb93a3a40"
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
    assert_match "0.8.5", shell_output("#{bin}/metabind --version")
  end
end
