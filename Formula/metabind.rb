class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.7/metabind-darwin-arm64.tar.gz"
      sha256 "5688d7063c746a6a1272193e91f8b362072b4fa90bd6953c8d08d7625fb526e0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.7/metabind-darwin-x64.tar.gz"
      sha256 "0eb9705db3d34cd4957e2de2af850a0af82e72366816898e84839fc21e78daad"
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
    assert_match "0.8.7", shell_output("#{bin}/metabind --version")
  end
end
