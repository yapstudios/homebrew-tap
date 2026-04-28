class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.49"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.49/metabind-darwin-arm64.tar.gz"
      sha256 "5df09a397d34f2bc09d87f88d7e52a5c30e8871cd450089fd2398536c70e3df9"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.49/metabind-darwin-x64.tar.gz"
      sha256 "d462b74860164fe51c4922e647f960ee12bd0e5f803d75753f714dce1e94f949"
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
    assert_match "0.7.49", shell_output("#{bin}/metabind --version")
  end
end
