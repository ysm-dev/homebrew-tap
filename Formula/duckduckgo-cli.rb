class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.6/duckduckgo-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "e30b0fe56c6de818567a16dd93ff15fc2a675a5b60594b71961099b6d4518b9e"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.6/duckduckgo-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "8016970cc3f5dad9e5a1e6b80ea4de0dfe816a12b18b96fd2d8ccb88db80dfca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.6/duckduckgo-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4bc197abef753383fb2da35805172bbccb0123f736e6b04570c1f31f19d2541"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.6/duckduckgo-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fec1c0a0e8206f598c1e6a603da114e33a94961f4323a12d145fa9429e56cf43"
    end
  end

  def install
    bin.install "bin/duckduckgo"
    bin.install_symlink "duckduckgo" => "ddg"
    man1.install "share/man/man1/duckduckgo.1" if File.exist?("share/man/man1/duckduckgo.1")
    bash_completion.install "share/completions/duckduckgo.bash" => "duckduckgo"
    zsh_completion.install "share/completions/_duckduckgo"
    fish_completion.install "share/completions/duckduckgo.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/duckduckgo --version")
  end
end
