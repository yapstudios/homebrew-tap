class ZeplinCli < Formula
  desc "Command-line interface for the Zeplin API"
  homepage "https://github.com/yapstudios/zeplin-cli"
  url "https://github.com/yapstudios/zeplin-cli/archive/refs/tags/0.4.1.tar.gz"
  sha256 "dc9f62a3533344ca8c79923ee267366d071eebf2b46b669deb5e33d5c38b70c3"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/zeplin-cli"
    generate_completions_from_executable(bin/"zeplin-cli", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zeplin-cli --version")
  end
end
