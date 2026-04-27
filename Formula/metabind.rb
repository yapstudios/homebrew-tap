class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.11/metabind-darwin-arm64.tar.gz"
      sha256 "4ca4902da87f40f41b7a4d79e3eed89742bf9ded6405f815b5fa96ae1b40c1d7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.11/metabind-darwin-x64.tar.gz"
      sha256 "601109e34f4ab2e7c57ac95e133b8cc8170870a080eb1970400f19f3ac250230"
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
    assert_match "0.7.11", shell_output("#{bin}/metabind --version")
  end
end
