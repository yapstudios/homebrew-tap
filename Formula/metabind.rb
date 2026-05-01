class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.22"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.22/metabind-darwin-arm64.tar.gz"
      sha256 "2086587bf09e3afad540eca107d86c84d69da4b86fee94087e8e53a57bb6eba8"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.22/metabind-darwin-x64.tar.gz"
      sha256 "91376a97829c4f3a5a360fdb19a7ed0c63df37e368194041f38ccf362141df75"
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
    assert_match "0.8.22", shell_output("#{bin}/metabind --version")
  end
end
