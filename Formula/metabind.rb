class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.27/metabind-darwin-arm64.tar.gz"
      sha256 "40cb7bff82184366595109f1bd626f3e47c0fde61050bd683012ad49e5905765"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.27/metabind-darwin-x64.tar.gz"
      sha256 "e5aedc1e41f75c661ac00a04e7042fa1d2e5ef523735d0b48ce3047313be1c60"
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
    assert_match "0.7.27", shell_output("#{bin}/metabind --version")
  end
end
