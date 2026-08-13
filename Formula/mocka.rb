class Mocka < Formula
  desc "AI-powered local mock server with MCP support"
  homepage "https://github.com/ljdongz/Mocka"
  url "https://github.com/ljdongz/Mocka/archive/refs/tags/v3.1.1.tar.gz"
  sha256 "fe98fe3f775f1c70ca2994eb96d3c599a1c8ac665cc41d2c1a3fd88dfc2b7a71"
  license "MIT"

  depends_on "node@22"

  def install
    ENV.prepend_path "PATH", Formula["node@22"].opt_bin

    system "npm", "install"
    system "npm", "run", "build"
    system "npm", "prune", "--production"

    libexec.install Dir["*"]
    chmod 0755, libexec/"server/dist/cli.js"

    (bin/"mocka").write_env_script(
      libexec/"server/dist/cli.js",
      PATH: "#{Formula["node@22"].opt_bin}:$PATH"
    )
  end

  service do
    run [opt_bin/"mocka", "start"]
    keep_alive true
    log_path var/"log/mocka/output.log"
    error_log_path var/"log/mocka/error.log"
  end

  def post_install
    (var/"log/mocka").mkpath
  end

  def caveats
    <<~EOS
      Data is stored in ~/Library/Application Support/Mocka/
      and persists across upgrades and uninstalls.

      To remove data completely:
        rm -rf ~/Library/Application\\ Support/Mocka

      Start Mocka:
        mocka start

      Stop Mocka:
        mocka stop

      Check status:
        mocka status

      Admin UI:    http://localhost:4649
      Mock Server: http://localhost:4650

      Configure ports:
        mocka config                                # View settings
        mocka config admin_port=5000 mock_port=5001  # Change ports

      MCP (AI agent integration):
        mocka mcp install

      Optional — auto-start on login via launchd:
        brew services start mocka
    EOS
  end

  test do
    assert_match "Usage: mocka", shell_output("#{bin}/mocka help 2>&1", 1)
  end
end
