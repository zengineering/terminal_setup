Vagrant.configure(2) do |config|
  config.vm.box = "terrywang/archlinux"
  #config.vm.provision :shell, path: "arch_setup.sh"
  config.vm.synced_folder ".", "/shared"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
    v.name = "vagrant_arch"

    config.ssh.forward_agent = true
    config.ssh.forward_x11 = true
  end
end
