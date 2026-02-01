class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.3/mb-darwin-arm64.tar.gz"
      sha256 "ae798c18df3af55191ec8d247c826070d23f66443e10c37d5eaea4129712237a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.3/mb-darwin-x64.tar.gz"
      sha256 "3d80e8b5ded7dc6a5b0cc61261aec1f6ca14ae5daa6e389a20317a4c21b15dd9"
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
    assert_match "0.4.3", shell_output("#{bin}/metabind --version")
  end
end
