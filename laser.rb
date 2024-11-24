class Laser < Formula
  desc "another ls alternative"
  homepage "https://github.com/jmattaa/laser"
  url "https://github.com/jmattaa/laser/archive/v1.0.1.tar.gz"
  sha256 "44544205ccc06c5f9f488c23716c407793f652ae5a0a630c83b0a5610a032f7a"
  license "MIT"
  version "v1.0.1"

  depends_on "make" => :build
  depends_on "gcc" => :build

  def install
    system "make release"
    bin.install "./bin/lsr"

    generate_completions_from_executable(bin/"lsr", "--completions")

    system "make clean"
  end
end
