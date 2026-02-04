class Xcodecloud < Formula
  desc "Command-line interface for Xcode Cloud via App Store Connect API"
  homepage "https://github.com/yapstudios/xcodecloud-cli"
  url "https://github.com/yapstudios/xcodecloud-cli/archive/refs/tags/1.0.5.tar.gz"
  sha256 "aa53c932e55ca377f3e6950b11af56c10ec89e4337192b31f98f16af9fc1d05d"
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
