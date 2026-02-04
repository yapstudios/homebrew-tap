class Xcodecloud < Formula
  desc "Command-line interface for Xcode Cloud via App Store Connect API"
  homepage "https://github.com/yapstudios/xcodecloud-cli"
  url "https://github.com/yapstudios/xcodecloud-cli/archive/refs/tags/1.1.3.tar.gz"
  sha256 "141dabf85eb0935fda7e89c245f0c1eb5612260307076b7a68b7169656bcbeb6"
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
