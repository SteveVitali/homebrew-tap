# Homebrew formula for claude-hibernate.
# Install from a tap: brew install <user>/tap/claude-hibernate
# The url/sha256 below are templates — RELEASING.md describes how they are
# filled in for each tagged release.
class ClaudeHibernate < Formula
  desc "Hibernate & wake Claude Code sessions across reboots"
  homepage "https://github.com/SteveVitali/claude-hibernate"
  url "https://github.com/SteveVitali/claude-hibernate/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "bc9b6206ffe355e539bdbb5dfdbaf5ba000d9814046085a486272ff23ba6c0c8"
  license "MIT"
  head "https://github.com/SteveVitali/claude-hibernate.git", branch: "main"

  depends_on "python@3.12"

  def install
    bin.install "scripts/claude-hibernate.sh" => "claude-hibernate"
  end

  test do
    assert_match "claude-hibernate", shell_output("#{bin}/claude-hibernate --version")
  end
end
