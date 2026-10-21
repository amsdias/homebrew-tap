class KeetPlayer < Formula
  desc "Low-CPU terminal audio player with visualizations, EQ and synced lyrics"
  homepage "https://github.com/amsdias/Keet"
  url "https://github.com/amsdias/Keet/archive/refs/tags/v2.0.4.tar.gz"
  sha256 "20bf747b6c2073204dcd301b69c5bbe1cd1fbf7f0c58d57917741176b836e320"
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
