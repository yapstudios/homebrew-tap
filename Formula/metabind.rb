class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.41/metabind-darwin-arm64.tar.gz"
      sha256 "78799e131f9b9d04d428564e53238f562df6b3f87ab3b8bd750eb2da058b9cdc"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.41/metabind-darwin-x64.tar.gz"
      sha256 "987f97133c7f0df3a654ee3e3f4cca47fa2ab63dd96b8d79b1a2b935ebc6ca01"
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
    assert_match "0.7.41", shell_output("#{bin}/metabind --version")
  end
end
