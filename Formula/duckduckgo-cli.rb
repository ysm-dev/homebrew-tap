class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.5/duckduckgo-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "57a019387deef381dfca03bb93c0edf937802338f65d776e74a3eeaf219fe366"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.5/duckduckgo-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "3f5daeccf62ea5dd91391aa36021a844eab633504df71a4566776c31fb5dc1a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.5/duckduckgo-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "674114b5f9272514340e1bdfcbc408dc082e9712de420408bdfd65fe2bd9c1b2"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.5/duckduckgo-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b63e4e41757645696f399641d41cc85c17714f060b6777cc6841505860e09ff1"
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
