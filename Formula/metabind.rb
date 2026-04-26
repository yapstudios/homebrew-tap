class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.49/metabind-darwin-arm64.tar.gz"
      sha256 "18e682c48b4eec8125193037689c0908cc03f9de1826bf7c29a19717ecb56a29"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.49/metabind-darwin-x64.tar.gz"
      sha256 "7a96ee562360e723c9cc606e7aeee0049f6b053bd1f959e56bc398583a89e3ac"
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
    assert_match "0.6.49", shell_output("#{bin}/metabind --version")
  end
end
