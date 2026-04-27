class Metabind < Formula
  desc "Metabind CLI — agent-first primitive surface for building and shipping MCP apps"
  homepage "https://github.com/yapstudios/metabind-cli"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.2/metabind-darwin-arm64.tar.gz"
      sha256 "18ef3316cf333ccfe7c8eff548cc342a8e4ad25e5100e087299440f56f147fbe"
    else
      url "https://github.com/yapstudios/homebrew-tap/releases/download/v0.7.2/metabind-darwin-x64.tar.gz"
      sha256 "113b8fad9ed72fda005ea2852febe35a2117abb09efe5ae96aa677a652a84b21"
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install "metabind-darwin-arm64" => "metabind"
    else
      bin.install "metabind-darwin-x64" => "metabind"
    end
  end

  test do
    assert_match "0.7.2", shell_output("#{bin}/metabind --version")
  end
end
