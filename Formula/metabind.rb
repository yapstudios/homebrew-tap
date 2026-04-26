class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.48"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.48/metabind-darwin-arm64.tar.gz"
      sha256 "212b8ba570ec0f62ccfe18d05c36fe309ca3244dfcc4215d692683563fdf6c7d"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.48/metabind-darwin-x64.tar.gz"
      sha256 "acf7f0ee2a4c1d7bb468bda637c9b4413a21832b817a4931d362bde36d19b215"
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
    assert_match "0.6.48", shell_output("#{bin}/metabind --version")
  end
end
