class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.10/sfsym-v0.2.10-macos-universal.tar.gz"
  sha256 "8f2a46ccace8284281690478db5818227bed232e2e1ec3183cfec8642b47a46d"
  license "MIT"
  version "0.2.10"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
