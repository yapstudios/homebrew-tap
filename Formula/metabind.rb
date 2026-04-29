class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.66"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.66/metabind-darwin-arm64.tar.gz"
      sha256 "545076779454bafea5a44dab119f3d7c1019ef7cc00c4c116f37173fa37e3bf4"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.66/metabind-darwin-x64.tar.gz"
      sha256 "66f6cdcf30ff0981adfb7ce4528b2ffc7463591429d5a46536b248853a4bd24f"
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
    assert_match "0.7.66", shell_output("#{bin}/metabind --version")
  end
end
