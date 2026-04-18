class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.9/sfsym-v0.2.9-macos-universal.tar.gz"
  sha256 "e57861b4a70cc67216afaa313631630594df3e90b141623adecae74a3c24441f"
  license "MIT"
  version "0.2.9"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
