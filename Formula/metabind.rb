class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.61"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.61/metabind-darwin-arm64.tar.gz"
      sha256 "dacebd8fe4e428bacfb7b53d33b27c5aea300f7e086f9db8b070689a70d26145"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.61/metabind-darwin-x64.tar.gz"
      sha256 "51e75f5c9c35374b9ea45a4f27e4a5c527bd5c3b982937e20fe46f5131437d4b"
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
    assert_match "0.7.61", shell_output("#{bin}/metabind --version")
  end
end
