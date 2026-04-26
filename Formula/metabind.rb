class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.41/metabind-darwin-arm64.tar.gz"
      sha256 "a5ffa610ba1d5aac8fda2121bc26db428e93aea34632be7b34e764042a461945"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.41/metabind-darwin-x64.tar.gz"
      sha256 "4d023090300eac67086fe1a677d0f21a50b531e2dc56db83304ff7e0a2aef5ed"
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
    assert_match "0.6.41", shell_output("#{bin}/metabind --version")
  end
end
