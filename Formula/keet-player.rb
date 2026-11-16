class KeetPlayer < Formula
  desc "Low-CPU terminal audio player with visualizations, EQ and synced lyrics"
  homepage "https://github.com/amsdias/Keet"
  url "https://github.com/amsdias/Keet/archive/refs/tags/v2.1.1.tar.gz"
  sha256 "aaec3e3351f906313ea78c0d82d0fe4340f783881a66d462d5a7d58068f65cb8"
  license "AGPL-3.0-or-later"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "alsa-lib"
    depends_on "dbus"
    depends_on "openssl@3"
  end

  def install
    system "cargo", "install", *std_cargo_args
    prefix.install "THIRD_PARTY_LICENSES"
  end

  test do
    assert_match "keet v#{version}", shell_output("#{bin}/keet --version")
  end
end
