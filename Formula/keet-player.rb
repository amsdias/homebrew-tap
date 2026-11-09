class KeetPlayer < Formula
  desc "Low-CPU terminal audio player with visualizations, EQ and synced lyrics"
  homepage "https://github.com/amsdias/Keet"
  url "https://github.com/amsdias/Keet/archive/refs/tags/v2.1.0.tar.gz"
  sha256 "f9c57e1595ba424f0fd6aa90d1306d78063406d5ecd54f6ee8e805c9510f44e1"
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
