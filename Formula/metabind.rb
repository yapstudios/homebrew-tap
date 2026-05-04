class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.24"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.24/metabind-darwin-arm64.tar.gz"
      sha256 "69632410aea19f6b164cec59560cd33b4264f68fa026df1fbaf61088b75e241c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.24/metabind-darwin-x64.tar.gz"
      sha256 "65800eb65c99210f5b2800b892e83ee0ea61000e972ce6b27e90ee08d0a026d5"
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
    assert_match "0.8.24", shell_output("#{bin}/metabind --version")
  end
end
