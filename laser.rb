class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.1.0.tar.gz"
  sha256 "e0ae7a0aa3c439c8d1c2fa0b5c0fe404df38fc6a5399bc8b97bf52a2537c7eee"
  license "MIT"
  version "v1.1.0"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable("build/lsr", "--completions")
  end
end
