class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.1.0.tar.gz"
  sha256 "d4c320aaca0594b6cd066f7a05430e2f025f914517ac7799490e5b03a9bee281"
  version "0.1.0"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
end
