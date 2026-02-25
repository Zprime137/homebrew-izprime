class Izprime < Formula
  desc "High-performance prime sieving library and CLI"
  homepage "https://github.com/Zprime137/iZprime"
  url "https://github.com/Zprime137/iZprime/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "fc6d0fa1035535695581b798d86f11cc63754591e2dc88230519290f1b265c2f"
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
