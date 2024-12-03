class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.2.0.tar.gz"
  sha256 "3bd2bc912f2187889d02b8e7fdb0278a5099bce15ab79cb656e9d573aba83df4"
  license "MIT"
  version "v1.2.0"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable("build/lsr", "--completions")
  end
end
