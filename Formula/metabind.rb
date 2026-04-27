class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.1/metabind-darwin-arm64.tar.gz"
      sha256 "347b2979ee4176ce364506c94a6d05a2422d2238ece10ff2eedddd4cdfa971d0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.1/metabind-darwin-x64.tar.gz"
      sha256 "c5080184e79174bdd6231209f745da27718e89a3128d13bea111237911c9db96"
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
    assert_match "0.7.1", shell_output("#{bin}/metabind --version")
  end
end
