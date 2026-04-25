class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.27"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.27/metabind-darwin-arm64.tar.gz"
      sha256 "5271f21e350ac30c636401b4b006e56a303238d057632967d5c8e870d32393bd"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.27/metabind-darwin-x64.tar.gz"
      sha256 "1b4e2b0410e4c4a0a059142276233fab4f29a11338815e3e98b3c32f68543704"
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
    assert_match "0.6.27", shell_output("#{bin}/metabind --version")
  end
end
