class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.16/metabind-darwin-arm64.tar.gz"
      sha256 "4f3d468c67e4b7c92e140cce8ace1e997fa14a19c89c434150dcc0ad4cb19823"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.16/metabind-darwin-x64.tar.gz"
      sha256 "869f74afc1c786ea9f5238736bc244a79f0b72171c601db531d29bc302550273"
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
    assert_match "0.7.16", shell_output("#{bin}/metabind --version")
  end
end
