class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.0.2.tar.gz"
  sha256 "a73615a7076bf1d4075f185c9c96667eb6631f3ef52843c0ae61d862c09f1159"
  license "MIT"
  version "v1.0.2"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable("build/lsr", "--completions")
  end
end
