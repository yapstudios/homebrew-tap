class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.19/metabind-darwin-arm64.tar.gz"
      sha256 "fd444aa6d9bf404837f6cff59f84dee966e8147aae430771d2e998a4fd0d9d8a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.19/metabind-darwin-x64.tar.gz"
      sha256 "4cce57bb69a28a2a7bc2e2a1f9e9c105d7674b7a6ebc21a47705511ae503cb72"
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
    assert_match "0.6.19", shell_output("#{bin}/metabind --version")
  end
end
