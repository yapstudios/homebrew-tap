class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.5/metabind-darwin-arm64.tar.gz"
      sha256 "26b9313e8556b99abb0a2ee8c8c409aba3be9412f34568e7b6412282214267e8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.5/metabind-darwin-x64.tar.gz"
      sha256 "26ccf4e1cc3e806ee3480859fbbf32ee7e596dc4c06a350d18a88a2e91131bd4"
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
    assert_match "0.6.5", shell_output("#{bin}/metabind --version")
  end
end
