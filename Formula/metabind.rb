class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.37/metabind-darwin-arm64.tar.gz"
      sha256 "ddffe69cd47d6586e4ab679a84be7741ddc2ec23d5c03eb0329f07300f1c88f7"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.37/metabind-darwin-x64.tar.gz"
      sha256 "aa6217cfa498645994fc74b1ea876638cde009659991e1c7a25ce5d91ca1ad35"
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
    assert_match "0.8.37", shell_output("#{bin}/metabind --version")
  end
end
