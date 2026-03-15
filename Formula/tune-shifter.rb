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
  url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
  sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  license "GPL-3.0-only"

  depends_on "python@3.11"

  resource "watchdog" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "musicbrainzngs" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "mutagen" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "requests" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "certifi" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "charset-normalizer" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "idna" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "urllib3" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "Pillow" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  # playwright publishes wheels only (no sdist); use the universal2 wheel for macOS.
  resource "playwright" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "greenlet" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "pyee" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  resource "typing-extensions" do
    url "https://github.com/eightyeighteyes/tune-shifter/releases/download/v0.2.1/tune_shifter-0.2.1.tar.gz"
    sha256 "a1bf8fc1c41284f3a130832b063dd21111150f57b0cd1447089249531eee1358"
  end

  def install
    virtualenv_install_with_resources
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
