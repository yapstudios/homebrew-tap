class Confluence < Formula
  desc "Confluence CLI — fast reading and creation of Confluence content from the terminal"
  homepage "https://github.com/yapstudios/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-arm64.tar.gz"
      sha256 "3e004883c0e6256fbd0ad6dd8f798fd1c444874b6c5f120b94a872f2456309fd"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-x64.tar.gz"
      sha256 "28cea5a613dabd08470aadc07998375b4c5e8ab1392555416fcb0519bd20c6be"
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
