class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.31"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.31/metabind-darwin-arm64.tar.gz"
      sha256 "32117a1d27282c17b168618f9cb058afc866cfee3870b6714863fcc63da253d7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.31/metabind-darwin-x64.tar.gz"
      sha256 "5f9e7c13444aae030adce0212831e85caae1b22fb30eaee3201def051db7bd5b"
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
    assert_match "0.6.31", shell_output("#{bin}/metabind --version")
  end
end
