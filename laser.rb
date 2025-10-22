class Laser < Formula
  desc 'another ls alternative'
  homepage 'https://github.com/jmattaa/laser'
  url "https://github.com/jmattaa/laser/archive/main.tar.gz"
  sha256 "3a76b37a6a37018fc50408ef4fd7653b771f26261141502987564cd1b4e16e03"
  license 'MIT'
  version "main"

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
