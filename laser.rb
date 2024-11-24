class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.0.0.tar.gz"
  sha256 "a3b5e3c1b228bc987ec1de40b78822dbdeb37e645d186f4d521d426e4f329403"
  license "MIT"
  version "v1.0.0"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
