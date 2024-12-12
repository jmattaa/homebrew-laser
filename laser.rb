class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.3.1.tar.gz"
  sha256 "f3abeefbaff3925bea85e86a60dde9dbfec753eb1802ea1c5a4c186c68c6e22b"
  license "MIT"
  version "v1.3.1"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable("build/lsr", "--completions")
  end
end
