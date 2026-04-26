class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.43/metabind-darwin-arm64.tar.gz"
      sha256 "b5461a0a3cae978b59571b7b1d6f67a9fba67fc49f9b87fc3981de8b5d62b8ce"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.43/metabind-darwin-x64.tar.gz"
      sha256 "c04fc5613990337b8bc84c90df4abd65a5a3a5bde7e79d1bfaabebc78d78d8f5"
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
    assert_match "0.6.43", shell_output("#{bin}/metabind --version")
  end
end
