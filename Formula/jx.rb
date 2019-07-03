# This file was generated by GoReleaser. DO NOT EDIT.
class Jx < Formula
  desc "A tool to install and interact with Jenkins X on your Kubernetes cluster."
  homepage "https://jenkins-x.io/"
  version "2.0.392"

  if OS.mac?
    url "http://github.com/jenkins-x/jx/releases/download/v2.0.392/jx-darwin-amd64.tar.gz"
    sha256 "d0d473047328b9db930868243a02a0b6773decb35565fcdc8e66a938c6513e36"
  elsif OS.linux?
    url "http://github.com/jenkins-x/jx/releases/download/v2.0.392/jx-linux-amd64.tar.gz"
    sha256 "9255f0419f042224c47d98b1712f1464153d1f070ce71f7affaea69c0622b0e1"
  end

  def install
    bin.install name
    
    output = Utils.popen_read("SHELL=bash #{bin}/jx completion bash")
    (bash_completion/"jx").write output
    
    output = Utils.popen_read("SHELL=zsh #{bin}/jx completion zsh")
    (zsh_completion/"_jx").write output
    
    prefix.install_metafiles
  end

  test do
    system "#{bin}/jx --version"
  end
end
