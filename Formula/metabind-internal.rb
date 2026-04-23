class MetabindInternal < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.2/metabind-internal-darwin-arm64.tar.gz"
      sha256 "08e4518e0ce255d461ba3e69c367198734927a9d37e54b4869de0582a66f15e1"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.2/metabind-internal-darwin-x64.tar.gz"
      sha256 "b89c072323958883a91105d10addae8ad0b315285a9b4d57126a77cd3afb5a55"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "metabind-internal-darwin-arm64" => "metabind-internal"
    else
      bin.install "metabind-internal-darwin-x64" => "metabind-internal"
    end
  end

  test do
    assert_match "0.5.2", shell_output("#{bin}/metabind-internal --version")
  end
end
