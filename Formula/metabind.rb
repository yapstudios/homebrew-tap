class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.60"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.60/metabind-darwin-arm64.tar.gz"
      sha256 "828e399be94ef9f60a5ea256ae11d88acec50bea647b52cf2a499882a375ae87"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.60/metabind-darwin-x64.tar.gz"
      sha256 "26a576fc35d3cf2ccc1e5a980c7ff39e8d36fb8a36fc17ea1c5002d67702db6f"
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
    assert_match "0.7.60", shell_output("#{bin}/metabind --version")
  end
end
