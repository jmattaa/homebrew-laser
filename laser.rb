class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.3.0.tar.gz"
  sha256 "6ba20deb5f2c76b6f34276a0c254999ce4233b5277f02f55a767208f31642a46"
  license "MIT"
  version "v1.3.0"

  depends_on "cmake" => :build
  depends_on "lua"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    generate_completions_from_executable("build/lsr", "--completions")
  end
end
