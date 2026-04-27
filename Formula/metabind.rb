class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.21/metabind-darwin-arm64.tar.gz"
      sha256 "0cb1939f68ab533057c7d51c05e2cc25a76a07902d0d865fc486b5ae325cc440"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.21/metabind-darwin-x64.tar.gz"
      sha256 "5bcb5eea98874562fc4df3cb41ec06eed0e171a75b2ee69dd13e03655b772e0f"
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
    assert_match "0.7.21", shell_output("#{bin}/metabind --version")
  end
end
