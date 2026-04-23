class Metabind < Formula
  desc "Metabind consumer CLI — turn your APIs + components into an MCP app"
  homepage "https://github.com/yapstudios/metabind-consumer-cli"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.0.1/metabind-darwin-arm64.tar.gz"
      sha256 "b0327956b0845e79c5e00d8aaf7f43aa011762dbf9b5b4c2de908f29b80480e3"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.0.1/metabind-darwin-x64.tar.gz"
      sha256 "c62e04e155b22ab56da072b863058a2c2cb2f943fe2dcb9a71d1e61462255f69"
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
    assert_match "0.0.1", shell_output("#{bin}/metabind --version")
  end
end
