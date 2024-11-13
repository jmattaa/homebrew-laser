class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.0.tar.gz"
  sha256 "cfea206351e97ba79e6fe1a8b561a9dfc42f826d7b434e308ce473a6c370e64c"
  version "v0.2.0"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
end
