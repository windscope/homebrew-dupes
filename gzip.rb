class Gzip < Formula
  desc "Popular GNU data compression program"
  homepage "https://www.gnu.org/software/gzip"
  url "http://ftpmirror.gnu.org/gzip/gzip-1.7.tar.gz"
  mirror "https://ftp.gnu.org/gnu/gzip/gzip-1.7.tar.gz"
  sha256 "eccbaa178c7801618c887956f1668d45bb57863a9d2678bfc3e36d01fb951904"

  bottle do
    cellar :any_skip_relocation
    sha256 "625966e71e8e1f4e7fbf18a04245d8eaa9f19cda4b6ba0a1da225bf2d45fe4f2" => :el_capitan
    sha256 "0c3831ee6a76be8a6bcefbe70ec7110206e7f7d5b6424ff66d955d42c399bb85" => :yosemite
    sha256 "e478304886a15ebf094e58b2c566f87a57729fab686b302018f4493c29185f0e" => :mavericks
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"foo").write "test"
    system "#{bin}/gzip", "foo"
    system "#{bin}/gzip", "-t", "foo.gz"
    assert_equal "test", shell_output("#{bin}/gunzip -c foo")
  end
end
