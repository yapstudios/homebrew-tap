class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.0/mb-darwin-arm64.tar.gz"
      sha256 "b7b72dd9a637bc09747194af26f1b45c04930e4ec6899c16da5bfd3de173dc93"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.0/mb-darwin-x64.tar.gz"
      sha256 "5c1bc67332319df2681a2e6215dae91e2a0b02e172699cc830fa08ff2b829e3e"
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
    assert_match "0.4.0", shell_output("#{bin}/metabind --version")
  end
end
