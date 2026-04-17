class Sfsym < Formula
  desc "Export Apple SF Symbols as vector SVG, vector PDF, or PNG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/releases/download/v0.2.4/sfsym-v0.2.4-macos-universal.tar.gz"
  sha256 "6e8cd341e5d3d49ed60483129eed4297a8cc4104344caa3689a19be5f679767e"
  license "MIT"
  version "0.2.4"

  depends_on :macos

  def install
    bin.install "sfsym"
  end

  test do
    assert_match "sfsym #{version}", shell_output("#{bin}/sfsym --version")
    assert_match "export", shell_output("#{bin}/sfsym schema")
  end
end
