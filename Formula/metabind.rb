class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.46"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.46/metabind-darwin-arm64.tar.gz"
      sha256 "52935a31855f3a1b5c088854a4254fffd06e87dbddd087dc0b5536037404dd96"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.46/metabind-darwin-x64.tar.gz"
      sha256 "509127f3209163dc2b55c2f0c20f8f512849ece7826805cb0b24f3c0ed257858"
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
    assert_match "0.7.46", shell_output("#{bin}/metabind --version")
  end
end
