class Mask < Formula
  desc "CLI task runner defined by a simple markdown file"
  homepage "https://github.com/jakedeichert/mask/"
  url "https://github.com/jakedeichert/mask/archive/v0.11.0.tar.gz"
  sha256 "8e2ddca51c691aa7bb18e377803e68e1769a0bcef1ddb1ef510537fcbfbb863d"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "4bb4f50cb4b31ea3aa48bb6465cefd751ad350e1d7b13923ca6abcb8228920f3"
    sha256 cellar: :any_skip_relocation, big_sur:       "ea79a3d72ac52b2d3c333495caa91e6944de76e2d14442f8c1204018240d9712"
    sha256 cellar: :any_skip_relocation, catalina:      "2d2e0026a9fead7ff7a8dc4ccfc1be23924227009f52e2f20497c442ec348d04"
    sha256 cellar: :any_skip_relocation, mojave:        "d012c47efd8013a13aa07bfcd5b2a6b7a3ee25cd6f798b1e3e523f9ab574b1ce"
  end

  depends_on "rust" => :build

  def install
    cd "mask" do
      system "cargo", "install", *std_cargo_args
    end
  end

  test do
    (testpath/"maskfile.md").write <<~EOS
      # Example maskfile

      ## hello (name)

      ```sh
      printf "Hello %s!" "$name"
      ```
    EOS
    assert_equal "Hello Homebrew!", shell_output("#{bin}/mask hello Homebrew")
  end
end
