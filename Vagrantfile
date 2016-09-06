# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "fedora/24-cloud-base"
  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provider :libvirt do |domain|
    # basic config
    domain.memory = 8192
    domain.cpus = 2

    # nested virt config
    domain.cpu_mode = 'host-passthrough'
    domain.nested = true

    # other config
    domain.volume_cache = 'none'
  end

  # It seems necessary to use NFS, per
  # https://github.com/vagrant-libvirt/vagrant-libvirt/issues/557
  config.vm.synced_folder '.', '/vagrant', type: 'nfs', nfs_udp: false, nfs_version: 4

  config.vm.provision :shell, :path => "install.sh", privileged: false
end
