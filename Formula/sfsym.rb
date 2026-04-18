class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.7/sfsym-v0.2.7-macos-universal.tar.gz"
  sha256 "282f93c33cbbc5f3f9f297c23a18fbb51639da5f36d5d3d6d9c862112a1c48af"
  license "MIT"
  version "0.2.7"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
