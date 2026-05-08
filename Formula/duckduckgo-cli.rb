class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "757eb35444c18a7fa3f0022589d8dbbea56c13a01790ee7940a1f385855c5afa"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "40ef74312899904656cef016934fbdcd85fd2f4044da77359c288ec9426c8b72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fbbec6d48629875af1b48777eccef1f9c89228ffb9f37ad8eef09165a6eef906"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76b1cb71cdcd39a1a00b0dc35416780048c15d5dd08b3811a5546026a0ff6e90"
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
