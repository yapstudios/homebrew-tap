class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.7/mb-darwin-arm64.tar.gz"
      sha256 "99228ae78ef0eacee24056661d0f1d23cad24602246cf9f41fa5b8cef59f2533"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.7/mb-darwin-x64.tar.gz"
      sha256 "0e949ff3740989fbdf428eca04cf6866ba72b47365cc0b609b9cc8220c3909e2"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "metabind"
    else
      bin.install "mb-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.4.7", shell_output("#{bin}/metabind --version")
  end
end
