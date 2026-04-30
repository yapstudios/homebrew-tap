class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.4/metabind-darwin-arm64.tar.gz"
      sha256 "0080e1fe6f9c954df98cd1aeb42d4916ce4eb467c374a9a2e0a6c1788ac25859"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.4/metabind-darwin-x64.tar.gz"
      sha256 "fb3808a6f60ef43011a73b1067f33918ce1886bc08c2fc21fef0bcf9cd9c6650"
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
    assert_match "0.8.4", shell_output("#{bin}/metabind --version")
  end
end
