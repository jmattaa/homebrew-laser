class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.6.0.tar.gz"
  sha256 "68a17f1e8d309e2973456dd5f07f465c4333463401543db38db51820dced2e59"
  license "MIT"
  version "v1.6.0"

  depends_on "cmake" => :build
  depends_on "lua"
  depends_on "libgit2"

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, "-DLUA_SCRIPTS_INSTALL_PATH=#{prefix}/lsr"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"

    bin.install "build/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")
  end

  def post_install
    home_dir = ENV["HOME"]
    lsr_dir = "#{home_dir}/.lsr"

    mkdir_p lsr_dir
    cp_r Dir["#{prefix}/lsr/*"], lsr_dir
  end

  test do
    system bin/"lsr", "--version"
  end
end
