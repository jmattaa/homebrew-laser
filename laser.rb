class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.3.1.tar.gz"
  sha256 "645311dc8f8a284a6f3b1ac4dc6dffab7214ebf97f2c049eeee368d49f58dc8c"
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
