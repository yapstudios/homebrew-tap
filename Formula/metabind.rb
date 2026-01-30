class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.2.0/mb-darwin-arm64.tar.gz"
      sha256 "fd070d23472305e07b4d3bc75ce7da77f47b39021513541b03e38f8e6c83e3b2"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.2.0/mb-darwin-x64.tar.gz"
      sha256 "260fad38fc3796aabad59cd0556c40438fc9c9b696461a51724687ce4059de37"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "mb"
    else
      bin.install "mb-darwin-x64" => "mb"
    end
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/mb --version")
  end
end
