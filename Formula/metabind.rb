class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.9/mb-darwin-arm64.tar.gz"
      sha256 "9eb61aea04515f652e1b81024e6e1db97886bf30af710a802bd64362fbd51e57"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.9/mb-darwin-x64.tar.gz"
      sha256 "dc3daafbfaf16a3425560577ce65394e4630d62011d716667f75a8b49bc81330"
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
    assert_match "0.4.9", shell_output("#{bin}/metabind --version")
  end
end
