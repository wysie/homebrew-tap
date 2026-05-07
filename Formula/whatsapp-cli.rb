class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.2.tar.gz"
  sha256 "bae968d1aeaa878238efb5f9820cc0a8a795e70a76400b82075661c902f43d6a"
  version "0.2.1-wysie.2"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "1"
    system "go", "build", "-tags", "sqlite_fts5", "-o", bin/"whatsapp", "./cmd/whatsapp"
  end

  test do
    system "#{bin}/whatsapp", "--version"
  end
end
