class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.2/metabind-darwin-arm64.tar.gz"
      sha256 "ca808253bc338c040be365c97b40c0ea5f381191f49a2976b9e5d90635b58c85"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.2/metabind-darwin-x64.tar.gz"
      sha256 "bbdeb758027cecb92d4ce220bc5d97aea9ca4ecce1d5ce50510f8f36467f26c0"
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
    assert_match "0.6.2", shell_output("#{bin}/metabind --version")
  end
end
