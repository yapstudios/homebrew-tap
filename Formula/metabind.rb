class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.6/metabind-darwin-arm64.tar.gz"
      sha256 "e5d9656c13e6cbe88991df146780ba25ba9bf7868af4e126544c00c9dd9d7328"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.6/metabind-darwin-x64.tar.gz"
      sha256 "19153fdb2f1bc9f0a8125b7de2ecd28615518fbf28b51c8eb6bb1ee0a0c8e178"
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
    assert_match "0.6.6", shell_output("#{bin}/metabind --version")
  end
end
