class Simtool < Formula
  desc "Stream and automate Apple Simulators"
  homepage "https://github.com/mstroshin/SimTool"
  url "https://github.com/mstroshin/SimTool/releases/download/v0.2.0/simtool-v0.2.0-macos-arm64.tar.gz"
  version "0.2.0"
  sha256 "cfc096c668c32005af2f91b4b25891738535a80bc83607d0631cccf8732e0aa0"

  def install
    bin.install "bin/simtool"
    prefix.install "README.md" if File.exist?("README.md")
  end

  def caveats
    <<~EOS
      SimTool requires local Apple simulator tooling.
      Install Xcode or Command Line Tools, select it with xcode-select, and install simulator runtimes.
      AXe is optional and required only for accessibility automation commands.
      Run: simtool doctor
    EOS
  end

  test do
    assert_match "Stream and automate Apple Simulators", shell_output("#{bin}/simtool --help")
  end
end
