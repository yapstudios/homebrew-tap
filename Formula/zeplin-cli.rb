class ZeplinCli < Formula
  desc "Command-line interface for the Zeplin API"
  homepage "https://github.com/yapstudios/zeplin-cli"
  url "https://github.com/yapstudios/zeplin-cli/releases/download/0.5.0/zeplin-cli-macos.tar.gz"
  sha256 "681cdfbaa20709669fd9f730f0837914ab384207bf90a48038cc9b5963e86d96"
  license "MIT"

  depends_on macos: :monterey

  def install
    bin.install "zeplin-cli"
    generate_completions_from_executable(bin/"zeplin-cli", "--generate-completion-script")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zeplin-cli --version")
  end
end
