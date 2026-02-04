class Xcodecloud < Formula
  desc "Command-line interface for Xcode Cloud via App Store Connect API"
  homepage "https://github.com/yapstudios/xcodecloud-cli"
  url "https://github.com/yapstudios/xcodecloud-cli/archive/refs/tags/1.2.0.tar.gz"
  sha256 "b50ef81f54c5735f67b2cd491b1b80107ce305fcddb7e61e29b36fd895937acf"
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
