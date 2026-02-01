class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.4/mb-darwin-arm64.tar.gz"
      sha256 "6d9c5cc5040421b5f55410e2b45aa0d43642d495ace43d6bf818ce739950c6a5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.4/mb-darwin-x64.tar.gz"
      sha256 "ff6e2daefeb001e0b00e8c696e2a67d30290509c1d64f73580062ade53ce9244"
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
    assert_match "0.4.4", shell_output("#{bin}/metabind --version")
  end
end
