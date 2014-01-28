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
  config.vm.box_url = "http://files.vagrantup.com/"+default+".box"
  
  # Database box
  config.vm.define "database" do |vm|
    ip = "10.6.0.2"
    vm.vm.box = default
    vm.vm.hostname = "vmrent-master"
    vm.vm.network "private_network", :ip => ip
    vm.vm.synced_folder "movies" , "/var/movies"
    ### Puppet provision
    vm.vm.provision :puppet do |puppet|
      puppet.options = "--debug"
      puppet.hiera_config_path = "manifests/hiera.yaml"
      puppet.manifests_path = "manifests"
      # puppet.manifest_file  = "database.pp"
      puppet.module_path = "modules"
       puppet.facter = {
         "box" => "database",
         "ip" => ip
        }
    end
  end


  # Torrent Box
  config.vm.define "torrent" do |vm|
    ip = "10.6.0.3"
    vm.vm.box = default
    vm.vm.hostname = "vmrent-master"
    vm.vm.network "private_network", :ip => ip
    vm.vm.network "forwarded_port", guest: 9091, host: 9092
    vm.vm.synced_folder "movies" , "/var/movies"
    ### Puppet provision
    vm.vm.provision :puppet do |puppet|
      puppet.options = "--debug"
      puppet.hiera_config_path = "manifests/hiera.yaml"
      puppet.manifests_path = "manifests"
      puppet.manifest_file  = "torrent.pp"
      puppet.module_path = "modules"
       puppet.facter = {
         "box" => "torrent",
         "ip" => ip
        }
    end
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
