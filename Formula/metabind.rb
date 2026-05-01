class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.17/metabind-darwin-arm64.tar.gz"
      sha256 "eb7465bbf4bc5b3f5a66fadc7d9a04095b5b92eae674bb888e0650d18ee5573e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.17/metabind-darwin-x64.tar.gz"
      sha256 "361d323f20015a0bc5d59e53b9b58277516dacbc81bd9a9996c34f457b252f9d"
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
    assert_match "0.8.17", shell_output("#{bin}/metabind --version")
  end
end
