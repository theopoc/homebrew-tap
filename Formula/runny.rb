class Runny < Formula
  desc "Run shell commands across selected child directories from a TUI"
  homepage "https://github.com/theopoc/runny"
  url "https://github.com/theopoc/runny/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "66a350766a7006c5b46cc0093c338a00c93e9563a8b5a942875d628e1f684bb8"
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
