class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.1.tar.gz"
  sha256 "c6892c1cd93a751681ed33b06f73fa6675c4340d2c037ab45f2d530f5774aa30"
  version "v0.2.1"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
end
