class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.8.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.14/metabind-darwin-arm64.tar.gz"
      sha256 "db0c2195225ea1c577f99702331cb955e50320a9301906336bda692050cf0982"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.8.14/metabind-darwin-x64.tar.gz"
      sha256 "1e8e8d23b853d21d6588a758e6b35d6ef1d19ba3b1397c54a4bce4a6c71ccc13"
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
    assert_match "0.8.14", shell_output("#{bin}/metabind --version")
  end
end
