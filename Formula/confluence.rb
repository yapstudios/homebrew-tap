class Confluence < Formula
  desc "Confluence CLI — fast reading and creation of Confluence content from the terminal"
  homepage "https://github.com/yapstudios/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-arm64.tar.gz"
      sha256 "710d82ca6b9c53a66127017c05fe768f5a86923c32eddcb544d3da21ad25b99a"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-x64.tar.gz"
      sha256 "ba5fb0561edf8043c24cea06ddeb37ac0bb47930f436e3ff896572814b739861"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "confluence-darwin-arm64" => "confluence"
    else
      bin.install "confluence-darwin-x64" => "confluence"
    end
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/confluence --version")
  end
end
