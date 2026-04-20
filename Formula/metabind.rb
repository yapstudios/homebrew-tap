class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.0/mb-darwin-arm64.tar.gz"
      sha256 "78777a5ec2c2cec2a2000d2cb0f406a8ac323e4042b0880ff2af91cf1f9466ee"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.0/mb-darwin-x64.tar.gz"
      sha256 "7ecec428fd0b0b07bcffbb1e91d69b949b336cfcf0613c621c8c270f22963ad1"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "mb-darwin-arm64" => "metabind"
    else
      bin.install "mb-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/metabind --version")
  end
end
