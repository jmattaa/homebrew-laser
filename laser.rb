class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.4.6.tar.gz"
  sha256 "9079f4d6ace2872f25beca954bfac7b1adf71e00b24466c5902455a1cf3800f8"
  license "MIT"
  version "v1.4.6"

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
