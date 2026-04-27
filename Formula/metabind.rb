class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.3/metabind-darwin-arm64.tar.gz"
      sha256 "3dc93e83fb8b9f20939f440664c2c5aa5ec6afecce3bbad357afd13411441355"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.3/metabind-darwin-x64.tar.gz"
      sha256 "a31ae2e75c4b1caf1d93806c0f3fc21edeed5a0e3c93fee97a36d69400cae729"
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
    assert_match "0.7.3", shell_output("#{bin}/metabind --version")
  end
end
