class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.25/metabind-darwin-arm64.tar.gz"
      sha256 "9ee2d3bdad9853e348ed02db3a7bb640392dad58692a0631d88e172e5e9438be"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.25/metabind-darwin-x64.tar.gz"
      sha256 "c5a6fb2eeae5c50da3fa97d30d0293918da607c17f5b881ea7957aa76e31c9c1"
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
    assert_match "0.7.25", shell_output("#{bin}/metabind --version")
  end
end
