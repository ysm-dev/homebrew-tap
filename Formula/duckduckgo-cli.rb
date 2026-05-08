class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.1/duckduckgo-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "995269ca50abf8ae7b34e0583a39295504f824ce083749139421fcb5983647a5"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.1/duckduckgo-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "d8c3abf424807215d67031f93d71ec151734bc16f2a0c811de9c69acc0ed5c86"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.1/duckduckgo-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b538caa936d8c1437a3fd92d49c17670d819d7eff142c15f802a44c45f369d95"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.1/duckduckgo-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8078aed745a3ae8df831ffd8b14aa4e8d8137a664648cc841ee764d1e63e1e5"
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
