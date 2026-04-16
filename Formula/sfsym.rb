class Sfsym < Formula
  desc "Extract Apple SF Symbols as real-vector SVGs — offline, from the system"
  homepage "https://github.com/yapstudios/sfsym"
  url "https://github.com/yapstudios/sfsym/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "571a2575c719b3ddd0766721844e27d3b2ca3cef022c7fd9380054cf3d52db09"
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
