class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.1/mb-darwin-arm64.tar.gz"
      sha256 "d7ca9024e0db001683413257ac77774fa3bd06814e9d8de3ba9731d94d5b1211"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.1/mb-darwin-x64.tar.gz"
      sha256 "8f576395a3b0208b693e0d89459b99dabd3a8a879aca07219336ac412961297b"
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
    assert_match "0.4.1", shell_output("#{bin}/metabind --version")
  end
end
