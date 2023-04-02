  class Bd9 < Formula
    desc "Github Commit Backdater"  
    homepage "https://github.com/scamelot/bd9"
    
    version "3"
    sha256 "94fb2e46d44f94adeca7c8a62cd0da8f4a9803970d0a295dbf22c81a7620a542" => :catalina, "dc8dcb7605c0f66a475aaf01551711b6de21ca849b762319bd6916b591a45ef1" => :x86_64_linux

    if OS.mac?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-darwin-universal2.tar.gz"
        sha256 "MACOS_SHA256SUM" => :catalina, "LINUX_SHA256SUM" => :x86_64_linux

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
