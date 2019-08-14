require "formula"

class GodaddyCli < Formula
  homepage "https://7wmr.uk"
  url "https://github.com/7wmr/godaddy-cli.git"
  head "https://github.com/7wmr/godaddy-cli.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    # Install Go dependencies
    system "go", "get", "github.com/spf13/cobra"
    system "go", "get", "github.com/spf13/viper"
    system "go", "get", "github.com/7wmr/godaddy-cli/conf"
    system "go", "get", "github.com/7wmr/godaddy-cli/cmd"

    system "go", "build", "-o", "godaddy"
    bin.install "godaddy"
  end

  test do
    system "#{bin}/godaddy", "-v"
  end
end




