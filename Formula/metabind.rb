class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.27/metabind-darwin-arm64.tar.gz"
      sha256 "6eababe4111caa4ae004454709963dd92d4445b98f18e30c255c6e450c18852e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.27/metabind-darwin-x64.tar.gz"
      sha256 "26faf007188f6790eb75d02014fc540a97b20213e3779946d314957246161531"
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
    assert_match "0.8.27", shell_output("#{bin}/metabind --version")
  end
end
