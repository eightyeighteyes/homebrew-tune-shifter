# This formula lives in the homebrew-tune-shifter tap repo (Formula/tune-shifter.rb).
# A copy is kept here as source of truth. The release workflow patches `url` and
# `sha256` in the tap repo automatically on each tagged release.
#
# One-time tap setup:
#   brew tap GITHUB_USERNAME/tune-shifter
#   brew install tune-shifter
#
# (Requires a GitHub repo named `homebrew-tune-shifter` containing this file.)

class TuneShifter < Formula
  include Language::Python::Virtualenv

  desc "Automated audio library ingest daemon for Bandcamp downloads"
  homepage "https://github.com/eightyeighteyes/tune-shifter"
  url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
  sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  license "GPL-3.0-only"

  depends_on "python@3.11"

  resource "watchdog" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "musicbrainzngs" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "mutagen" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "requests" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "certifi" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "charset-normalizer" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "idna" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "urllib3" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "Pillow" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  # playwright publishes wheels only (no sdist); use the universal2 wheel for macOS.
  resource "playwright" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "greenlet" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "pyee" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  resource "typing-extensions" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.2/tune_shifter-0.2.2.tar.gz"
    sha256 "9d80c46b41edf819a02694d97a66e5085723e4acc112b6f3a8b1235465771ab1"
  end

  def install
    virtualenv_install_with_resources
    bin.install_symlink libexec/"bin/tune-shifter"
    (share/"tune-shifter").install "USAGE.md"
  end

  def caveats
    usage = (share/"tune-shifter"/"USAGE.md").read
    <<~EOS
      #{usage}
      Bandcamp auto-download requires Playwright browser binaries.
      Run this once after install:

        #{prefix}/libexec/bin/playwright install chromium

    EOS
  end

  test do
    system bin/"tune-shifter", "--help"
  end
end
