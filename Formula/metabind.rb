class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.46/metabind-darwin-arm64.tar.gz"
      sha256 "22862532eb68f8b16c8db3ba2d78c8cdae68d902a37d5ba401d40e1817248f4d"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.46/metabind-darwin-x64.tar.gz"
      sha256 "acd30c64589b10aa9e85306ad77fd54aba2fef5f1c9a6db42bad3103502d568f"
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
    assert_match "0.6.46", shell_output("#{bin}/metabind --version")
  end
end
