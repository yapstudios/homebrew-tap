class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.10/mb-darwin-arm64.tar.gz"
      sha256 "0c216842fd1fec53315eadf4c11e82281b2e7926b754ff5ce3715887584f80c1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.10/mb-darwin-x64.tar.gz"
      sha256 "fdb0f3ad06284661500d225f8bd1c7ef6bbd66986dd9cf19d73b91b2c00b98f1"
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
    assert_match "0.4.10", shell_output("#{bin}/metabind --version")
  end
end
