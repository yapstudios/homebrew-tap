class Xcodecloud < Formula
  desc "Command-line interface for Xcode Cloud via App Store Connect API"
  homepage "https://github.com/yapstudios/xcodecloud-cli"
  url "https://github.com/yapstudios/xcodecloud-cli/archive/refs/tags/1.0.9.tar.gz"
  sha256 "fa774f2049f21a65f826e6df77fc3a3ee5e817e2cf87dcc524b7dc6da7605c72"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/xcodecloud"
    generate_completions_from_executable(bin/"xcodecloud", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcodecloud --version")
  end
end
