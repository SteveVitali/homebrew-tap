# Homebrew formula for claude-readout.
# Install from the tap: brew install SteveVitali/tap/claude-readout
#
# Generated for v0.1.0 from the published release checksums. GoReleaser writes
# this file automatically at tag time (see .goreleaser.yaml `brews:`); this copy
# was placed by hand because the release token lacked Contents:write here.
# Digests are verbatim from the release's checksums.txt.
class ClaudeReadout < Formula
  desc "Terminal-aware status line for Claude Code"
  homepage "https://github.com/SteveVitali/claude-readout"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/SteveVitali/claude-readout/releases/download/v0.1.0/claude-readout_0.1.0_darwin_amd64.tar.gz"
      sha256 "ac6e5438002f59d0ad23682e738411365d9f08deffbe4b05f1c11f057e069bb7"

      def install
        bin.install "claude-readout"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/SteveVitali/claude-readout/releases/download/v0.1.0/claude-readout_0.1.0_darwin_arm64.tar.gz"
      sha256 "d54fa4a8f113b0f47549c8542ddb5a328ba8a618b7e1e93f7fec94de9e16b604"

      def install
        bin.install "claude-readout"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/SteveVitali/claude-readout/releases/download/v0.1.0/claude-readout_0.1.0_linux_amd64.tar.gz"
      sha256 "ae04cbfe282704c3045311d429862d4ce88ccf07815ca36d507bd06d4b16150c"

      def install
        bin.install "claude-readout"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/SteveVitali/claude-readout/releases/download/v0.1.0/claude-readout_0.1.0_linux_arm64.tar.gz"
      sha256 "54fd3c00deb1297221238844b344cc83dac4d08046cd2a17c50dfb52ebf731a8"

      def install
        bin.install "claude-readout"
      end
    end
  end

  test do
    system "#{bin}/claude-readout", "version"
  end
end
