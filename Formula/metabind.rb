class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.7/metabind-darwin-arm64.tar.gz"
      sha256 "dd52445ede2f33adf3f97d08ae1fd0e9913b9bf55deebbbceab41cb6d87bb768"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.6.7/metabind-darwin-x64.tar.gz"
      sha256 "3fd6a7523da53defc92ae814deda643a54e0a1bbbb03fe91e58c52de09f6cccc"
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
    assert_match "0.6.7", shell_output("#{bin}/metabind --version")
  end
end
