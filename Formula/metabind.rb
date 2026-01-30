class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.2.1/mb-darwin-arm64.tar.gz"
      sha256 "96473fdcaf72f5840a3b111dd1f1fab17a6a35020e33b4cf9861fc04651787f0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.2.1/mb-darwin-x64.tar.gz"
      sha256 "5dfd11f6b6b4ed8a69e3609511a171c4c8fcba045bd38a0b3008c5d32dba9c14"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "mb"
    else
      bin.install "mb-darwin-x64" => "mb"
    end
  end

  test do
    assert_match "0.2.1", shell_output("#{bin}/mb --version")
  end
end
