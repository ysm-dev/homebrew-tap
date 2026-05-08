class DuckduckgoCli < Formula
  desc "Agent-first DuckDuckGo search CLI"
  homepage "https://github.com/ysm-dev/duckduckgo-cli"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.3/duckduckgo-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "2487293fe381aca79e5b1d42a32741ee20c8809fde1aea8233e01c2b7d48ae59"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.3/duckduckgo-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "7ce98625bed4a7781e43415a0b966f759013c3a03268e677b7b632a641d29a91"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.3/duckduckgo-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ab8a1bf828401e986f9e93cdbf43da6621c7eae23ffedd299ed1ab1f32c03d2"
    end
    on_intel do
      url "https://github.com/ysm-dev/duckduckgo-cli/releases/download/v0.1.3/duckduckgo-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f6f501312d8e38b3d73d1efab65f22ae40d554549955c58a76571e0fd003950"
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
