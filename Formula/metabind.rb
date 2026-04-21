class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.1/mb-darwin-arm64.tar.gz"
      sha256 "22e659813300be9be0f9b6cf6d76aef2b2b46104d0a9aa918edaaa61c421f6f8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.1/mb-darwin-x64.tar.gz"
      sha256 "339dfe060f09d55895fa1a9636fa1e89b7bb96f3bf9f36953d9feb62d1558004"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "metabind"
    else
      bin.install "mb-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/metabind --version")
  end
end
