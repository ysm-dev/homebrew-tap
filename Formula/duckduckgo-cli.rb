class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "b115016d1a201379d2b0a41fa02538197daeb975b5b7007f297e7425ab4422c9"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "af9fc97cd5eb6a10aa818314277aa2a9a018486c127c82ea3eb267ad6d8e4daa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dcb4fc6b14daa3da8ac027a3fca678d12a54e831e3acfd1c5f3d00c937d2fc89"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.0/duckduckgo-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1aaba954eceb06603793b6abd9b6c0774a3b3a2a3a6136f03328e53ec5859ff"
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
