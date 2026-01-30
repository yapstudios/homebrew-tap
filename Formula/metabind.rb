class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.3.0/mb-darwin-arm64.tar.gz"
      sha256 "e1619211f7cd295ae795585940b5bf81584568adda0ece4b5fe2cbd34b0e7467"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.3.0/mb-darwin-x64.tar.gz"
      sha256 "d56f2bc9e6d799a181766f1e9ab7085076d6043c348a3a43526608d20eb840bc"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "metabind"
    else
      bin.install "mb-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/metabind --version")
  end
end
