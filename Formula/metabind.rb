class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.15/metabind-darwin-arm64.tar.gz"
      sha256 "896749dadf5bc9f72a00d301e0629d0b6e3120969852a8f96f93f2389c403f7a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.15/metabind-darwin-x64.tar.gz"
      sha256 "d49781f2a4ce83e9c16698922b561a0bbf48dd5d62efac12c9a45517c08181af"
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
    assert_match "0.8.15", shell_output("#{bin}/metabind --version")
  end
end
