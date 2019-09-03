# This file was generated by GoReleaser. DO NOT EDIT.
class Jx < Formula
  desc "A tool to install and interact with Jenkins X on your Kubernetes cluster."
  homepage "https://jenkins-x.io/"
  version "2.0.669"

  url "http://github.com/jenkins-x/jx/releases/download/v#{version}/jx-darwin-amd64.tar.gz"
  sha256 "e15adf73093ce9c6602d3de407a544907b1ba86fbef163b86ff969a13cf4109a"

  def install
    bin.install name
    
    output = Utils.popen_read("SHELL=bash #{bin}/jx completion bash")
    (bash_completion/"jx").write output
    
    output = Utils.popen_read("SHELL=zsh #{bin}/jx completion zsh")
    (zsh_completion/"_jx").write output
    
    prefix.install_metafiles
  end

end
