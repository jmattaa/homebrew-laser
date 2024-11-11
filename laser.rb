class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.1.0.tar.gz"
  sha256 "e269b9eeaec11f823524cd28c557b115b95a1fae"
  version "0.1.0"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
