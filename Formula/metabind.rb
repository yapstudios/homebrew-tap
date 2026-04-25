class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.20/metabind-darwin-arm64.tar.gz"
      sha256 "1c2fe5506b428792e249043cfd62715081d21c8b235b11500e01179784672cc8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.20/metabind-darwin-x64.tar.gz"
      sha256 "5f3a954e9c10b53dbcd983770627bc8d0b74a2e7ec5f4fb7618df202d37080cc"
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
    assert_match "0.6.20", shell_output("#{bin}/metabind --version")
  end
end
