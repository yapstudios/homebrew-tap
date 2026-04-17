class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.5/sfsym-v0.2.5-macos-universal.tar.gz"
  sha256 "42576b93495b57b6b1b3bee89b55ddde99fda2d1889201062d5cdcf1312f2d40"
  license "MIT"
  version "0.2.5"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
