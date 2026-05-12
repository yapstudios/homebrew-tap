class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.11/sfsym-v0.2.11-macos-universal.tar.gz"
  sha256 "0d34f1233e48b695a4435533436a51a296f74bd9e673b09f1a243f628a3fb590"
  license "MIT"
  version "0.2.11"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
