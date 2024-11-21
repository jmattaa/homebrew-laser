class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.3.tar.gz"
  sha256 "b1247ad6e611cfef05d991aa7c7efdd09e012af58014bd0a76a86a03334a02bd"
  license "MIT"
  version "v0.2.3"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
