class Izprime < Formula
  desc "High-performance prime sieving library and CLI"
  homepage "https://github.com/Zprime137/iZprime"
  url "https://github.com/Zprime137/iZprime/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2d9d2367447471544f6fe93af84788adf3c6bdb34299a30299e06024c57d22a3"
  license "MIT"
  head "https://github.com/Zprime137/iZprime.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "gmp"
  depends_on "openssl@3"

  def install
    system "make", "install", "PREFIX=#{prefix}", "ARCH_NATIVE=0", "TUNE_NATIVE=0", "BUILD_SHARED=1"
  end

  test do
    output = shell_output("#{bin}/izprime help")
    assert_match "iZprime CLI", output
  end
end
