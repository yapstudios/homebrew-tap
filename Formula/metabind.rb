class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.51"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.51/metabind-darwin-arm64.tar.gz"
      sha256 "dde7b45f61af761e08d0fd7a247e21275c6322d43670638d5fac5d206748d646"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.51/metabind-darwin-x64.tar.gz"
      sha256 "e0c9125a668e8002ad0073a6714f085b06ae52babe3655b2a5905ed1ab382f6d"
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
    assert_match "0.7.51", shell_output("#{bin}/metabind --version")
  end
end
