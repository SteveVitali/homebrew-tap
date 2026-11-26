# Homebrew formula for claude-as.
# Install from the tap: brew install SteveVitali/tap/claude-as
# url/sha256 are filled in for each tagged release; see RELEASING.md.
class ClaudeAs < Formula
  desc "Multiple Claude Code accounts with separate logins and one shared setup"
  homepage "https://github.com/SteveVitali/claude-as"
  url "https://github.com/SteveVitali/claude-as/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "f7d83786aae0bad327bf12661bcbe34e528d473d1544010bf6548cb7f947ef82"
  license "MIT"
  head "https://github.com/SteveVitali/claude-as.git", branch: "main"

  depends_on "jq"

  def install
    bin.install "bin/claude-as"
  end

  def caveats
    <<~EOS
      Create a profile for another account and sign in to it:
        claude-as setup acme
        claude-as acme auth login
      Optionally add a `claude-acme` command:
        claude-as link acme
    EOS
  end

  test do
    assert_match "claude-as #{version}", shell_output("#{bin}/claude-as --version")
    ENV["HOME"] = testpath
    (testpath/".claude").mkpath
    (testpath/".claude/settings.json").write "{}"
    system bin/"claude-as", "setup", "acme"
    assert_predicate testpath/".claude-acme/settings.json", :symlink?
  end
end
