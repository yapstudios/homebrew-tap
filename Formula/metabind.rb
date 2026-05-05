class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.33/metabind-darwin-arm64.tar.gz"
      sha256 "bdedca060fbffdb543545b1fe90ebb4ef4d7a17742f9ccaf9d97b51a3407102c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.33/metabind-darwin-x64.tar.gz"
      sha256 "5245aeff5901f423d4c2e284cb53237cfb59273f7b2ebb645a0b67be00b94540"
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
    assert_match "0.8.33", shell_output("#{bin}/metabind --version")
  end
end
