class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.6.tar.gz"
  sha256 "54118d6b09198d6b55239b24e85247f1f9c65b932a1e2a3ecc4264f6f5403666"
  version "0.2.1-wysie.6"
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
