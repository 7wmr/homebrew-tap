require "formula"

class Ipsoft1deskCli < Formula
    homepage "https://ipsoft.com"
    url "https://github.com/ipsoft-tools/1desk-cli.git"
    head "https://github.com/ipsoft-tools/1desk-cli.git"

    depends_on "go" => :build

    def install
        ENV["GOPATH"] = buildpath

        # Install Go dependencies
        system "go", "get", "github.com/mitchellh/go-homedir"
        system "go", "get", "github.com/spf13/cobra"
        system "go", "get", "github.com/spf13/viper"
        system "go", "get", "github.com/ipsoft-tools/1desk-cli/conf"
        system "go", "get", "github.com/ipsoft-tools/1desk-cli/cmd"
        
        system "go", "build", "-o", "1desk"
        bin.install "1desk"
    end

    test do
        system "#{bin}/1desk", "-v"
    end
end




