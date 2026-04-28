class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.45/metabind-darwin-arm64.tar.gz"
      sha256 "22c722678a9538da5c0e4c3e2acb7ce9ab3aece2571907b32afe1e39a020420b"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.45/metabind-darwin-x64.tar.gz"
      sha256 "d9e4a93a679e6cc164a51e3365097125c396f523e99fa06c781d60a464aaa82f"
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
    assert_match "0.7.45", shell_output("#{bin}/metabind --version")
  end
end
