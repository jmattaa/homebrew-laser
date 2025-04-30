class Laser < Formula
  desc 'another ls alternative'
  homepage 'https://github.com/jmattaa/laser'
  url "https://github.com/jmattaa/laser/archive/v1.6.1.tar.gz"
  sha256 "d1b80cee28d333df0a60c9f542d08cfa0e20743b2ea2f66aa00ca5a4bc9a800a"
  license 'MIT'
  version "v1.6.1"

  depends_on 'cmake' => :build
  depends_on 'lua'
  depends_on 'libgit2'

  def install
    system 'cmake', '-S', '.', '-B', 'build', *std_cmake_args, "-DLUA_SCRIPTS_INSTALL_PATH=#{prefix}/lsr"
    system 'cmake', '--build', 'build'
    system 'cmake', '--install', 'build'

    bin.install 'build/lsr'

    generate_completions_from_executable(bin / 'lsr', '--completions')
  end

  def post_install
    home_dir = ENV['HOME']
    lsr_dir = "#{home_dir}/.lsr"

    mkdir_p lsr_dir
    cp_r Dir["#{prefix}/lsr/*"], lsr_dir
  end

  test do
    system bin / 'lsr', '--version'
  end
end
