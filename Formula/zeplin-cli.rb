class ZeplinCli < Formula
  desc "Command-line interface for the Zeplin API"
  homepage "https://github.com/yapstudios/zeplin-cli"
  url "https://github.com/yapstudios/zeplin-cli/archive/refs/tags/0.4.2.tar.gz"
  sha256 "53e253a7aebced5e51266d7b686e843f16598dcaae08945d00cbf890d8af9065"
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
