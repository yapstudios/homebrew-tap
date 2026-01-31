class Metabind < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.2/mb-darwin-arm64.tar.gz"
      sha256 "e706e85546d9f7966b011365df75eb518b3b9c383883ee276e52268fab2b263c"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.4.2/mb-darwin-x64.tar.gz"
      sha256 "a0cefba81c78f7f9e03fa66e3fc660152fc5dafc35c8449b268eee216d7d17ef"
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
    assert_match "0.4.2", shell_output("#{bin}/metabind --version")
  end
end
