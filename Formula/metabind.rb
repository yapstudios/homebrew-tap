class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.63"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.63/metabind-darwin-arm64.tar.gz"
      sha256 "c90da2100ff7a9798972c8e720daf95ee2e9318be84d0ae6a42113471b75de99"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.63/metabind-darwin-x64.tar.gz"
      sha256 "1646fa799a2a68d0c0350ac89e2703036b445078a1f6768dea56dedc9d8cca9f"
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
    assert_match "0.7.63", shell_output("#{bin}/metabind --version")
  end
end
