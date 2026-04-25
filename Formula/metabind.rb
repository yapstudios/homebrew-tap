class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.22/metabind-darwin-arm64.tar.gz"
      sha256 "b3387d72a933e174229c91dbc54968b956671c4d43c3f0261dbce44b0f1dd7b5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.22/metabind-darwin-x64.tar.gz"
      sha256 "4d05801b08e24bee94a553f9b46e1340c78e3ba4d2cab3fa4125e8e4d2e1acdf"
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
    assert_match "0.6.22", shell_output("#{bin}/metabind --version")
  end
end
