# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"

  # First upgrade puppet as default version has a major bug with nested contain
  # Then install puppet modules through shell inline command
  # This is to ensure the modules are installed AND not stored inside version control
  # When modules installation is running, puppet has not run yet, meaning /etc/puppet/modules may not have been created

  # config.vm.provision :shell, :path => "vagrant/scripts/install_puppet_modules.sh"
  # config.vm.provision :shell, :path => "vagrant/scripts/upgrade_puppet.sh"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
  end

  if Vagrant.has_plugin?("vagrant-proxyconf")
      if ENV["http_proxy"]
        config.proxy.http = ENV["http_proxy"]
      end
      if ENV["https_proxy"]
        config.proxy.https = ENV["https_proxy"]
      end
      if ENV["no_proxy"]
        config.proxy.no_proxy = ENV["no_proxy"]
      end
  end

end
