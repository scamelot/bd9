  class Bd9 < Formula
    desc "Github Commit Backdater"  
    homepage "https://github.com/scamelot/bd9"
    url "https://github.com/scamelot/bd9/releases/download//bd9-linux-x86_64.tar.gz"
    version ""
    sha256 ""

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
