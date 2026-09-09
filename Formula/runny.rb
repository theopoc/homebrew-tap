class Runny < Formula
  desc "Run shell commands across selected child directories from a TUI"
  homepage "https://github.com/theopoc/runny"
  url "https://github.com/theopoc/runny/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "e2898849acf1819cb60d9e1cb776cf397fcccfd81883a3a6358209d1e8a715c3"
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
