class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.3/sfsym-v0.2.3-macos-universal.tar.gz"
  sha256 "577acc4bc0fe0029fd59bc0a1e7981c01d4cb5455b98c31d64de3b66d88a883e"
  license "MIT"
  version "0.2.3"

  depends_on :macos

  def install
    bin.install "sfsym"
  end

  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
