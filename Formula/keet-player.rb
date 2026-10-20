class KeetPlayer < Formula
  desc "Low-CPU terminal audio player with visualizations, EQ and synced lyrics"
  homepage "https://github.com/amsdias/Keet"
  url "https://github.com/amsdias/Keet/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "c3812c98852fa129df42831d3995fa8fd22179519c02c92927ec4c8155e9585a"
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
