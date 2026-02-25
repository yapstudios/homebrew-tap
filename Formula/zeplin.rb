class Zeplin < Formula
  desc "Command-line interface for the Zeplin API"
  homepage "https://github.com/yapstudios/zeplin-cli"
  url "https://github.com/yapstudios/zeplin-cli/archive/refs/tags/0.2.0.tar.gz"
  sha256 "f02ad587fac645d4271847bec5d63414c8ad3662833e35dec712146781afc81e"
  license "MIT"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :monterey

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/zeplin"
    generate_completions_from_executable(bin/"zeplin", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zeplin --version")
  end
end
