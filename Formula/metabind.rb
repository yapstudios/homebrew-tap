class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.39/metabind-darwin-arm64.tar.gz"
      sha256 "02ccb5c6293d0de1633a2f6905f62afb5e21bbac574ea91368a6fd61ea0cdb7b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.39/metabind-darwin-x64.tar.gz"
      sha256 "0cea56f8d8fd742bc2c0c179ac422ef8b341e0b0973e90c12550d491dd9f597e"
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
    assert_match "0.7.39", shell_output("#{bin}/metabind --version")
  end
end
