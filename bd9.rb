  class Bd9 < Formula
    desc "Github Commit Backdater"  
    homepage "https://github.com/scamelot/bd9"
    
    version "4"
    sha256 "b1e118e6558c5a4d3ac72dd96ae0ed2e16b10b124157ed4dbac58545ee6e9fa5" => :catalina, "371e434b1df9ef0768519b2e429649e8a764a6f906473dff4b0c677980edbf84" => :x86_64_linux

    if OS.mac?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-darwin-universal2.tar.gz"

    elsif OS.linux?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-linux-x86_64.tar.gz"

    def install
      if OS.mac?
        bin.install "bd9-darwin-universal" => "bd9"
      elsif OS.linux?
        bin.install "bd9-linux-x86_64" => "bd9"
      end
    end

    test do
      system "#{bin}/bd9", "-h"
    end
  end
  EOF
