class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.10/metabind-darwin-arm64.tar.gz"
      sha256 "c5a75435c833be0af14ae9372e22c82b69f53ec9be8435ec4d34b2652e0f7687"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.10/metabind-darwin-x64.tar.gz"
      sha256 "a0cbcc3c2b3f6024cbd8ddc94fe0f24472a75ae849ac19402a1d87e5618d2a88"
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
    assert_match "0.7.10", shell_output("#{bin}/metabind --version")
  end
end
