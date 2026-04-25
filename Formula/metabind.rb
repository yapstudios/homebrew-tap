class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.18/metabind-darwin-arm64.tar.gz"
      sha256 "eacb14f87ccda58b2b352db154a7b60974dea42a70bd6d06eacbf6d0b6d22328"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.18/metabind-darwin-x64.tar.gz"
      sha256 "e880368090cddc26ecdb2bcc69f8c868ea90ee67d14d82a17315d8f6b966b0e1"
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
    assert_match "0.6.18", shell_output("#{bin}/metabind --version")
  end
end
