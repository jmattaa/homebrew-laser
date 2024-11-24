class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v0.2.4.tar.gz"
  sha256 "0fbf4279a2385891a081b90cb31079e3b460a43c36319b9e445e1d7eb40ac070"
  license "MIT"
  version "v0.2.4"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable(build/"lsr", "--completions")

    # clean
    system "cmake" "--build", "build", "--target", "clean"
  end
end
