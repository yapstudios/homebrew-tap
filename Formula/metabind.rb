class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.34/metabind-darwin-arm64.tar.gz"
      sha256 "8ba811b3f94cd52f96551dfd8b7087a53205e499de468133da16ad43128474f2"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.34/metabind-darwin-x64.tar.gz"
      sha256 "f4f11bd04630b386d13aa8fcdbb5ede9ca0fcaa7118808f268882204eb8b5350"
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
    assert_match "0.7.34", shell_output("#{bin}/metabind --version")
  end
end
