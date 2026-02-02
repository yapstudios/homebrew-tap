class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.5/mb-darwin-arm64.tar.gz"
      sha256 "2729929f661b2d42f07b8bb013cd31fba961aa6638574f23ec3f76835750cb38"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.5/mb-darwin-x64.tar.gz"
      sha256 "a89fe025acc5b0d42414f774fe9f5a9aeb3569ed28484edc05c3168ea1c62fde"
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
    assert_match "0.4.5", shell_output("#{bin}/metabind --version")
  end
end
