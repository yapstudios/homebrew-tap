class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.3/metabind-darwin-arm64.tar.gz"
      sha256 "40d0f29b5babb6d33aacbf7700bfd7d096ec71e476fc61b6cfb12844b40337d8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.3/metabind-darwin-x64.tar.gz"
      sha256 "bc0cbaa8cd9dece0a97f9a5aefad0cdc0217b0c7ab96b6671bc4fc96fd87ab95"
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
    assert_match "0.8.3", shell_output("#{bin}/metabind --version")
  end
end
