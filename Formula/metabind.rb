class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.52/metabind-darwin-arm64.tar.gz"
      sha256 "08858e32a3d9ffdd8a30f759ea2ff788949129de937c8f40df231307a0de7231"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.52/metabind-darwin-x64.tar.gz"
      sha256 "005283e78f00cc7c71c7c05d2d166016ad16e7afb3a913202f4a605e19bb35f9"
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
    assert_match "0.6.52", shell_output("#{bin}/metabind --version")
  end
end
