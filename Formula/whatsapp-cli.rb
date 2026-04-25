class WhatsappCli < Formula
  desc "WhatsApp from your terminal"
  homepage "https://github.com/Wysie/whatsapp-cli"
  url "https://github.com/Wysie/whatsapp-cli/archive/refs/tags/v0.2.1-wysie.1.tar.gz"
  sha256 "d7382e0bf4e7d6b60fdb2c827d3f4f693cf098af2d0f923f494e812c8cfb468e"
  version "0.2.1-wysie.1"
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
