class Izprime < Formula
  desc "High-performance prime sieving library and CLI"
  homepage "https://github.com/Zprime137/iZprime"
  url "https://github.com/Zprime137/iZprime/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "3e1db869200fb07da80763210322e4928aa56ce76c5df1d8836605346edaef25"
  license "MIT"
  head "https://github.com/Zprime137/iZprime.git", branch: "main"

  depends_on "pkg-config" => :build
  depends_on "gmp"
  depends_on "openssl@3"

  def install
    system "make", "install", "PREFIX=#{prefix}", "ARCH_NATIVE=0", "TUNE_NATIVE=0", "BUILD_SHARED=1"
  end

  test do
    assert_match "iZprime CLI", shell_output("#{bin}/izprime help")
  end
end
