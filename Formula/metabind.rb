class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.34/metabind-darwin-arm64.tar.gz"
      sha256 "8698001cd73405af87cdf5bd18cb6070c4f1e660a8c13cbdefb98564f0e860df"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.34/metabind-darwin-x64.tar.gz"
      sha256 "9570aea4df3ed691f8e35db3a51cf62ca8c60bc3be6dba9af97e211a6615699a"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "metabind-darwin-arm64" => "metabind"
    else
      bin.install "metabind-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.6.34", shell_output("#{bin}/metabind --version")
  end
end
