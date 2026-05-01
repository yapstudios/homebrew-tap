class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.19"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.19/metabind-darwin-arm64.tar.gz"
      sha256 "19699fc598209c4a0fa18b07bbdbedfbe79e4303c683ab55de6667db8e41698e"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.19/metabind-darwin-x64.tar.gz"
      sha256 "af2ef29f0e27160dac7d187f979550f61a46fa46f4ffacdb78a7262e11807e79"
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
    assert_match "0.8.19", shell_output("#{bin}/metabind --version")
  end
end
