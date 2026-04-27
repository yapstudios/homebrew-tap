class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.19/metabind-darwin-arm64.tar.gz"
      sha256 "7658a5ec562ca520bc157c90d25f3f4276b93f8fa047a49260a7b999e082d1b3"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.19/metabind-darwin-x64.tar.gz"
      sha256 "be174a1885e322849ecd3d918c7c414889e57dc5610d31da97c0fccc77f2983c"
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
    assert_match "0.7.19", shell_output("#{bin}/metabind --version")
  end
end
