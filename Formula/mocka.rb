class Mocka < Formula
  desc "Web-based HTTP & WebSocket mock server"
  homepage "https://github.com/ljdongz/Mocka"
  url "https://github.com/ljdongz/Mocka/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6d90afcd4a2fd5ef53bfa4892b5d65fae4581511de4790a2436c66fc7071061b"
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
    run [opt_bin/"mocka"]
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

      Admin UI:    http://localhost:3000
      Mock Server: http://localhost:8080

      Custom ports:
        ADMIN_PORT=4000 MOCK_PORT=9090 mocka start

      Optional — auto-start on login via launchd:
        brew services start mocka
    EOS
  end

  test do
    assert_match "Usage: mocka", shell_output("#{bin}/mocka help 2>&1", 1)
  end
end
