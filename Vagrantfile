# -*- mode: ruby -*-
# vi: set ft=ruby :

### HOST system detection
is_unix = is_win = false
File::SEPARATOR == '/' ? is_unix = true : is_win = true

### Override vagrant defaults
if is_unix
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vmware_fusion'
else
  ENV['VAGRANT_DEFAULT_PROVIDER'] = 'vmware_workstation'
end


Vagrant.configure(2) do |config|
  default = "precise64_vmware"

  # Torrent Box
  config.vm.define "torrent" do |web|
    config.vm.box = default
    config.vm.box.url = "http://files.vagrantup.com/"+default+".box"
      config.vm.hostname = "torrent-master"
      config.vm.network "private_network", :ip => "77.77.77.77"
      config.vm.network "forwarded_port", guest: 9091, host: 9092
      config.vm.synced_folder "movies" , "/var/movies"
      ### Puppet provision
      # config.vm.provision :puppet do |puppet|
      #   puppet.options = "--debug"
      #   puppet.hiera_config_path = "manifests/hiera.yaml"
      #   puppet.manifests_path = "manifests"
      #   puppet.manifest_file  = "default.pp"
      #   puppet.module_path = "modules"
      # end
  end
  


  ### UNIX specific settings
  if is_unix
     config.vm.provision "shell" do |s|
      s.inline = "echo $1"
      s.args   = "echo I am provisioning..."
      s.inline   = "ifconfig | grep 'inet addr:'"
    end
    
    
    

  end
end
