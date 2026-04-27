class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.5/metabind-darwin-arm64.tar.gz"
      sha256 "ebdd37c2af563e2bbe67d0ff26ae04b2d9a8dc8fc0705d89f3869a6e21539ffb"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.5/metabind-darwin-x64.tar.gz"
      sha256 "3011c9b7f742cc8213d7fde8d506584e0a71addea5fc01c63c8cee9182632a97"
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
    assert_match "0.7.5", shell_output("#{bin}/metabind --version")
  end
end
