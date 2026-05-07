class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.3.tar.gz"
  sha256 "98b93fbd97ee6f8f45e5be6e802203f6194a3531b757a8888e34539a6895a004"
  version "0.2.1-wysie.3"
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
