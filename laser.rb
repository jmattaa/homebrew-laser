class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.4.tar.gz"
  sha256 "0fbf4279a2385891a081b90cb31079e3b460a43c36319b9e445e1d7eb40ac070"
  license "MIT"
  version "v0.2.4"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
