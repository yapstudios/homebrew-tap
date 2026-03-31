class Xcodecloud < Formula
  desc "Command-line interface for Xcode Cloud via App Store Connect API"
  homepage "https://github.com/yapstudios/xcodecloud-cli"
  url "https://github.com/yapstudios/xcodecloud-cli/releases/download/1.2.4/xcodecloud-macos-universal.tar.gz"
  sha256 "823940923d02ea7d0c6d0152d19d0339cd19dfbadecb328eeef4599ec2df3c67"
  version "1.2.4"
  license "MIT"

  depends_on macos: :monterey

  def install
    bin.install "xcodecloud"
    generate_completions_from_executable(bin/"xcodecloud", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/xcodecloud --version")
  end
end
