class Confluence < Formula
  desc "Confluence CLI — fast reading and creation of Confluence content from the terminal"
  homepage "https://github.com/yapstudios/homebrew-tap"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-arm64.tar.gz"
      sha256 "22d834b3bef3a358328394a3b56a7a71e44bb2cd43c60f1d61c9a4fd08255a4e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/confluence-v0.1.0/confluence-darwin-x64.tar.gz"
      sha256 "a9e910a3d4864e7592038f52ccd809eced0f7c9e77a1ec5d48a2b3d37a4d74d7"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "confluence-darwin-arm64" => "confluence"
    else
      bin.install "confluence-darwin-x64" => "confluence"
    end
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/confluence --version")
  end
end
