class Laser < Formula
  desc 'another ls alternative'
  homepage 'https://github.com/jmattaa/laser'
  url "https://github.com/jmattaa/laser/archive/v1.7.1.tar.gz"
  sha256 "e540a95d7b7ddf7048645414b930b4fce280fddc383cd4b65125fed67050a8a9"
  license 'MIT'
  version "v1.7.1"

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
