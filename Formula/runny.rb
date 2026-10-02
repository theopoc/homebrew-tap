class Runny < Formula
  desc "Run shell commands across selected child directories from a TUI"
  homepage "https://github.com/theopoc/runny"
  url "https://github.com/theopoc/runny/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "ae3e1dd5a1dff6bb09bd70eb47d6ac4fa8eff4cffff9cb18a4b41da8f5a05bc5"
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
