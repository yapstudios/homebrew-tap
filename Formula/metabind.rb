class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.11/mb-darwin-arm64.tar.gz"
      sha256 "7e1a44fc4a1e2352d4d37d32d8598166c44af22119adbd419b3ea69c0aa8d4f0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.11/mb-darwin-x64.tar.gz"
      sha256 "6925a2114158d4c045cab14b26583c5fd6f5417dd6da955ec88bfbed04cae54a"
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
    assert_match "0.4.11", shell_output("#{bin}/metabind --version")
  end
end
