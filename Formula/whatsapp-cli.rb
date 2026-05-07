class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.4.tar.gz"
  sha256 "3e2782303b1a593416ec7b4d411c586816f8a65cb6a70cc8e109168df748ca59"
  version "0.2.1-wysie.4"
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
