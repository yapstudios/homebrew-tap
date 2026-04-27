class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.23/metabind-darwin-arm64.tar.gz"
      sha256 "e4d84f6c556206f176133cb5e1eb8846a20f8869e0841d0f291199a9442b5c7c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.23/metabind-darwin-x64.tar.gz"
      sha256 "2bebf78322bbfc4e8ec46eb32eb092aad854bb8f3503939896d1d0ab1dc2479c"
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
    assert_match "0.7.23", shell_output("#{bin}/metabind --version")
  end
end
