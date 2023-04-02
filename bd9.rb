  class Bd9 < Formula
    desc "Github Commit Backdater"  
    homepage "https://github.com/scamelot/bd9"
    
    version "5"

    if OS.mac?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-darwin-universal2.tar.gz"
      sha256 "3c63ac5a17844afe3a7757848503ce05726168cc05fe50d224addef8770bb99d"

    elsif OS.linux?
      url "https://github.com/scamelot/bd9/releases/download/#{version}/bd9-linux-x86_64.tar.gz"
      sha256 "f0274a06f3654caeb22e3bad2f6137007782b4fb3950b9e3747ca1bd2e9d5761"

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
