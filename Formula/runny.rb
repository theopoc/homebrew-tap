class Runny < Formula
  desc "Run shell commands across selected child directories from a TUI"
  homepage "https://github.com/theopoc/runny"
  url "https://github.com/theopoc/runny/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "fefa506d53dbf5195088730d9dadad9687331bbdc5ef1dbd9e36a113998d0531"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X github.com/theopoc/runny/internal/app.Version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/runny"
  end

  test do
    assert_match "runny #{version}", shell_output("#{bin}/runny --version")
  end
end
