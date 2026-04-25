class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.16/metabind-darwin-arm64.tar.gz"
      sha256 "73387fba5b1b8b4a1d6f37c1d85b287a98682e2bff6e7e48d55ed555613c26c2"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.16/metabind-darwin-x64.tar.gz"
      sha256 "87ad344bae9d758ea4c0ed6577e23c89843412e855668a79253f3201b3020a55"
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
    assert_match "0.6.16", shell_output("#{bin}/metabind --version")
  end
end
