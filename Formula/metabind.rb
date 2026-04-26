class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.45/metabind-darwin-arm64.tar.gz"
      sha256 "a5d5cdba8c79fea321b87cbfbe452b1e6a24629167b0628750a0d92760fc80a7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.45/metabind-darwin-x64.tar.gz"
      sha256 "14019c99540ebde12e24992f2bbb6bce6ddeec5db3b3eed5d4743d1b4ca05813"
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
    assert_match "0.6.45", shell_output("#{bin}/metabind --version")
  end
end
