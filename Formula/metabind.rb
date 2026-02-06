class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.6/mb-darwin-arm64.tar.gz"
      sha256 "8386549f2c8c42c9a32feac70590c939df9e7afa7c662f464c46e94cf7adf2b1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.6/mb-darwin-x64.tar.gz"
      sha256 "225b2194757bc8bae9ca8334f01cf6b3257dd51350f9ed634b50a88810d1c33f"
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
    assert_match "0.4.6", shell_output("#{bin}/metabind --version")
  end
end
