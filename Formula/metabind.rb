class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.22/metabind-darwin-arm64.tar.gz"
      sha256 "b6cc2480a1f9032b8677411bc34c1205b7e226eea4671f592595002756af21d5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.22/metabind-darwin-x64.tar.gz"
      sha256 "673219da38f5ec1bd7e84f3ae6ea2894b353e2b3120b053dc72b159695f4a126"
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
    assert_match "0.7.22", shell_output("#{bin}/metabind --version")
  end
end
