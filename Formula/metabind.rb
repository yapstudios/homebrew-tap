class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.12/metabind-darwin-arm64.tar.gz"
      sha256 "bd01985d73054e50a1afef98137975614c80fc6c7a48591ee54a88f0ed47b2b9"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.12/metabind-darwin-x64.tar.gz"
      sha256 "7831288bdb006c8b535fff08647ef9541deaaf6fe7e62330f605e4f4933f5f65"
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
    assert_match "0.8.12", shell_output("#{bin}/metabind --version")
  end
end
