class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.2/duckduckgo-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "a1beb99b520721c361e1ee4faa62ec9591e295541d043e7f4a34ae227bca094e"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.2/duckduckgo-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "3a78245f097026b45355cf928fbcf23c40562bf9846f2c59ae80f67af2261eec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.2/duckduckgo-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f33fef370e2b09e2c424893d57d9a9f889a5c922ef23801a290d617147656ff2"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.2/duckduckgo-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd8ca3a3b4cc8a79f3a21f87853723af5ddc493606209bda585f581f2398c659"
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
