class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.0/metabind-darwin-arm64.tar.gz"
      sha256 "917d42f55580747dd35f2220b4177de911b6be047289e65ca39e0599484abaaa"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.0/metabind-darwin-x64.tar.gz"
      sha256 "4a551e94b167aaaf3e13e111f8101c368ab4fef47b046e884053122826b82c80"
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
    assert_match "0.7.0", shell_output("#{bin}/metabind --version")
  end
end
