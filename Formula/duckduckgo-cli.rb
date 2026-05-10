class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.4/duckduckgo-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "50ad3d302fd2a80a9aed8f00c42e4ef9f8bf64c9e1eea1f15d88d01c7b9aec1f"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.4/duckduckgo-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "cd2919aea2fcf516181ec24806c76fecdbe2b28c006aa78ca7ac939866761137"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.4/duckduckgo-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0bc7b9c21909cea3e8bb8e8c7768fc04d22e5f8320d951029064b0b2eece3f5"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.4/duckduckgo-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47f03e68db096f92c02ca96564a3c671134446cf3691ab40e4af8b51579debf6"
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
