class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.8/mb-darwin-arm64.tar.gz"
      sha256 "cffd1b213e9b1e62455dfaf230318bfd81d7b7cb80da4e3ff30419ac1e601c65"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.8/mb-darwin-x64.tar.gz"
      sha256 "081074d12c70d7b880b8e922467bcb3cd553860c99415393f71e4e70013fa4da"
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
    assert_match "0.4.8", shell_output("#{bin}/metabind --version")
  end
end
