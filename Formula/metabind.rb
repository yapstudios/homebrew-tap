class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.64"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.64/metabind-darwin-arm64.tar.gz"
      sha256 "ec0eb28e4650d3682301c89f0bdc70dc1447a943af5544258751cff8d0602d2f"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.64/metabind-darwin-x64.tar.gz"
      sha256 "1522313c4bd7678476bb55c96e3fb15604b8f61e07c1c30f90fac6d43bc489e5"
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
    assert_match "0.7.64", shell_output("#{bin}/metabind --version")
  end
end
