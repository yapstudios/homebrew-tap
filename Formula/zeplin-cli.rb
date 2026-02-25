class ZeplinCli < Formula
  desc "Command-line interface for the Zeplin API"
  homepage "https://github.com/yapstudios/zeplin-cli"
  url "https://github.com/yapstudios/zeplin-cli/archive/refs/tags/0.2.1.tar.gz"
  sha256 "0d455cc9027b87359eb9f93b261f77ec81d07832c6d9115f88fd6474ed451043"
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
