class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.50"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.50/metabind-darwin-arm64.tar.gz"
      sha256 "1b7ca553e2e352dfb0d99cd0113ef63b8e62722ec09bc127683032286955466c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.50/metabind-darwin-x64.tar.gz"
      sha256 "d9ba6dd25667b573196d94558789076ae6fe324c4e18e1895dbc9f465715d336"
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
    assert_match "0.7.50", shell_output("#{bin}/metabind --version")
  end
end
