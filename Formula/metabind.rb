class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.39/metabind-darwin-arm64.tar.gz"
      sha256 "a067b053da6780b5bc080876579007cf4c05c12b3f89e54d6c1677790fdf5b31"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.39/metabind-darwin-x64.tar.gz"
      sha256 "5cf4c6fd6bd7e20d485b070d2021bc110f40e685c0d06a95bfb7966f74d09473"
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
    assert_match "0.8.39", shell_output("#{bin}/metabind --version")
  end
end
