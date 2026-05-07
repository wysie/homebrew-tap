class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.7.tar.gz"
  sha256 "8d2759fa41db90fd7a13b7f62337f6caa93dad5a57531c2e4f3b676346b34823"
  version "0.2.1-wysie.7"
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
