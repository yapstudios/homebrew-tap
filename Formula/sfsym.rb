class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.6/sfsym-v0.2.6-macos-universal.tar.gz"
  sha256 "137bec6cb8e8acb3441f124e4d1eb136aa94b76d944ab0e13b3bfe36f15cc552"
  license "MIT"
  version "0.2.6"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
