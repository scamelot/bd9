  class Bd9 < Formula
    desc "Github Commit Backdater"  
    homepage "https://github.com/scamelot/bd9"
    
    version "6"

    if OS.mac?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-darwin-universal2.tar.gz"
      sha256 "10f38c2596914dc5bef256f767311d3a00bc09bc3b8a9e154d4549001148ae2b"

    elsif OS.linux?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-linux-x86_64.tar.gz"
      sha256 "499e9a6a4ad2b832bd9285a07c208fd96e99aba8b59247efedfc78e45861c283"
    
    end

    def install
      if OS.mac?
        bin.install "bd9-darwin-universal2" => "bd9"
      elsif OS.linux?
        bin.install "bd9-linux-x86_64" => "bd9"
      end
    end

    test do
      system "#{bin}/bd9", "-h"
    end
  end
