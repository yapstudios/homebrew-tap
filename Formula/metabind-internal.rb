class MetabindInternal < Formula
  desc "Metabind CLI — headless CMS management from the command line"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.5.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.3/metabind-internal-darwin-arm64.tar.gz"
      sha256 "02f6bcb7465719a5d12577021914920f8d5304df887dfc87b45f01d3256e31d0"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.5.3/metabind-internal-darwin-x64.tar.gz"
      sha256 "447fc215fc6b56d369259f82ae610780b8db201dd0e5cd72335d27ea1a8e1393"
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
    assert_match "0.5.3", shell_output("#{bin}/metabind-internal --version")
  end
end
