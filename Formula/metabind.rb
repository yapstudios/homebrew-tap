class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.43/metabind-darwin-arm64.tar.gz"
      sha256 "5976f342c972fcf8c4391c1738829a3b1e74e18e8610dbdfe435cab220458bb5"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.43/metabind-darwin-x64.tar.gz"
      sha256 "39f973a744aa719274211540a1a20080e407b656cf5450e8df5a8358256ffc20"
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
    assert_match "0.7.43", shell_output("#{bin}/metabind --version")
  end
end
