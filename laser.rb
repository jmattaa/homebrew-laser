class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.4.7.tar.gz"
  sha256 "7524351c3f3af9c60ff0d84d2aaa20c3772466678df1c017fc206b815a6b0ce6"
  license "MIT"
  version "v1.4.7"

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
