
Vagrant.configure("2") do |config|

  config.vm.define 'esxi60' do |node_config|
    node_config.ssh.username = 'root'
    node_config.ssh.shell = 'sh'
    node_config.ssh.insert_key = false
    node_config.vm.synced_folder ".", "/vagrant", disabled: true

    ["vmware_fusion", "vmware_workstation"].each do |provider|
      node_config.vm.provider provider do |v, override|
        v.gui = true
        v.vmx["memsize"] = "4096"
        v.vmx["numvcpus"] = "2"
        v.vmx["vhv.enable"] = "TRUE"
      end
    end

    node_config.vm.box = 'esxi60'
    node_config.vm.hostname = 'esxi60'
    node_config.vm.box_url = './vmware_esxi60.box'
    node_config.vm.provision "shell", privileged: false, path: "scripts/provision.sh"
  end

  config.vm.define "win7" do |node_config|
    node_config.vm.box = "windows_7"
    #node_config.vm.hostname = "win7"

    node_config.vm.communicator = "winrm"
    node_config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true
    node_config.vm.network :forwarded_port, guest: 22, host: 2222, id: "ssh", auto_correct: true
    node_config.vm.network :forwarded_port, guest: 3389, host: 3389, id: "rdp", auto_correct: true

    node_config.vm.provision "shell", path: "scripts/provision.ps1", privileged: false

    node_config.vm.provider "virtualbox" do |vb, override|
      vb.gui = true
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.customize ["modifyvm", :id, "--cpus", 1]
      vb.customize ["modifyvm", :id, "--vram", "32"]
      vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
      vb.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
    end
    ["vmware_fusion", "vmware_workstation"].each do |provider|
      node_config.vm.provider provider do |v, override|
        v.gui = true
        v.vmx["memsize"] = "1024"
        v.vmx["numvcpus"] = "1"
      end
    end
  end

end
