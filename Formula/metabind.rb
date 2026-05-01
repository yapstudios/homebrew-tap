class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.11/metabind-darwin-arm64.tar.gz"
      sha256 "9b99d870e084d26f66c013d32b2ee64b8b257d689ba7fd4137618db8b201ef52"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.11/metabind-darwin-x64.tar.gz"
      sha256 "ec6e46f5686455da5014c38bfcb0798755b60f6d957e584d47fd9034bb1facb6"
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
    assert_match "0.8.11", shell_output("#{bin}/metabind --version")
  end
end
