class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/metabind-cli/releases/download/v0.1.0/mb-darwin-arm64.tar.gz"
      sha256 "0241ab4b55be17788ca4fc9179462e0c00bd768c10e6b9d7ecbd4cc2ec6b5cc8"
    else
      url "https://github.com/yapstudios/metabind-cli/releases/download/v0.1.0/mb-darwin-x64.tar.gz"
      sha256 "4011b0b9452b567c571f5a878326700e4cf22991d55d4b0771342c2c43133d59"
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
    assert_match "0.1.0", shell_output("#{bin}/mb --version")
  end
end
