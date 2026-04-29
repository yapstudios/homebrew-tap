class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.55"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.55/metabind-darwin-arm64.tar.gz"
      sha256 "479f2b5087a16796d1626bd3ab6fdd839189a28794461c733dfff4771355e680"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.55/metabind-darwin-x64.tar.gz"
      sha256 "9550a8a7f391e212c03466cac512f5d7248ffa8e5724ffc046b5537be2f1ecec"
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
    assert_match "0.7.55", shell_output("#{bin}/metabind --version")
  end
end
