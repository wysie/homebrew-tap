class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.5.tar.gz"
  sha256 "b598b1d35dd3d597ebe61a249afd2a8fb32f03cf30e77fafc84ef8ee70ccd514"
  version "0.2.1-wysie.5"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", "-tags", "sqlite_fts5", "-ldflags", "-X github.com/eddmann/whatsapp-cli/internal/cli.version=#{version}", "-o", bin/"whatsapp", "./cmd/whatsapp"
  end

  test do
    system "#{bin}/whatsapp", "--version"
  end
end
