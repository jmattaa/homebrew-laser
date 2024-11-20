class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.2.tar.gz"
  sha256 "834402479c01e1cdf240902b75d620795e4153eab1e9c3c5b9d7bf06673195b9"
  license "MIT"
  version "v0.2.2"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
