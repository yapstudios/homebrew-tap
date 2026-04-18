class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.8/sfsym-v0.2.8-macos-universal.tar.gz"
  sha256 "e09fe4c459c76339dcdb61a8aae704ac20650d447d6d5b15ad6e018504dd3f4e"
  license "MIT"
  version "0.2.8"
  depends_on :macos
  def install
    bin.install "sfsym"
  end
  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
