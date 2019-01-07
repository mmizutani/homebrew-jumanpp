class Jumanpp < Formula
  desc "Japanese Morphological Analyzer based on RNNLM"
  homepage "http://nlp.ist.i.kyoto-u.ac.jp/EN/index.php?JUMAN%2B%2B"
  url "https://github.com/ku-nlp/jumanpp/archive/v2.0.0-rc2.tar.gz"
  sha256 "75697a5e980899e827b5efa20ac02071dada1c3b9ab95fbf1d79bfc99f57050b"

  depends_on "boost"
  depends_on "boost-build"
  depends_on "gperftools"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    ENV["LANG"] = "C.UTF-8" # prevent "invalid byte sequence in UTF-8" on sierra build
    system bin/"jumanpp", "--version"
    IO.popen(bin/"jumanpp", "w") { |io| io.puts "こんにちは" }
  end
end
