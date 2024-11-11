class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/main.tar.gz"
  sha256 "e81ec0e62d42dc4052b7b94bef3e27bea20f625b8134bb15a18014c7445bab8c"
  version "main"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
end
