class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.20/metabind-darwin-arm64.tar.gz"
      sha256 "d5dfd30fd78f77ebe8bbced349c1f19da3637cbfb14666fe60fbdad924a276be"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.20/metabind-darwin-x64.tar.gz"
      sha256 "e27eaf99f92bdcbaa024bf27960537cddf2c9debef2fe73cc02eee0904aeb588"
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
    assert_match "0.8.20", shell_output("#{bin}/metabind --version")
  end
end
