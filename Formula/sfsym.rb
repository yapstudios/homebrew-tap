class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "95620c65200d4f7f843730c00d8c0911a00cd40f088fe9dd28ad39adff7a4acd"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/sfsym"
  end

  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
