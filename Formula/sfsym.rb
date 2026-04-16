class Sfsym < Formula
  desc "Export Apple SF Symbols as SVG"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "b74b0992239002f4b6003664e8d93d6a63ad3220aa9bd4c8729d5d26fcf1545b"
  license "MIT"

  depends_on :macos
  depends_on "python@3.12"

  def install
    # Rewrite the shebang to point at the Homebrew Python so sfsym runs under
    # a guaranteed ≥3.11 interpreter regardless of the user's env.
    inreplace "sfsym", %r{^#!/usr/bin/env python3$}, "#!#{Formula["python@3.12"].opt_bin}/python3.12"
    bin.install "sfsym"
  end

  test do
    assert_match "sfsym", shell_output("#{bin}/sfsym --help 2>&1", 0)
    assert_match "search", shell_output("#{bin}/sfsym schema --json 2>&1", 0)
  end
end
