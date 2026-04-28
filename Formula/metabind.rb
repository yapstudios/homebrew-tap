class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.52"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.52/metabind-darwin-arm64.tar.gz"
      sha256 "fe1a209507117522ea82bd701b56c443a9940b83c7744a25a5edd5ea346898cb"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.52/metabind-darwin-x64.tar.gz"
      sha256 "a21eb3d505e1cd14b3a72f6cce62f797add65383eb2351654cc271d9d83aa061"
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
    assert_match "0.7.52", shell_output("#{bin}/metabind --version")
  end
end
