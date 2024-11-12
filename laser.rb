class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.1.1.tar.gz"
  sha256 "4ebd6d85a85079d20bfce5497f8c066505c84be1de616fcd6bab3a91c40c7a42"
  version "v0.1.1"

  def install
    system "make release"
    bin.install "./bin/lsr"
    system "make clean"
  end
end
