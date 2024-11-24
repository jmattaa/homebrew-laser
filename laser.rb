class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.0.2.tar.gz"
  sha256 "5ca640f22efed1ce460297cd6f75712894866456f414d0010a4d56355795df8c"
  license "MIT"
  version "v1.0.2"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
