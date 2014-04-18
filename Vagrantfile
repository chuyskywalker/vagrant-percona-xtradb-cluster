VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

# todo: haproxy
#    config.vm.define :p2 do |p2|
#        p2.vm.box     = "centos65-x86_64-20140116"
#        p2.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
#        p2.vm.hostname = "p2.local.dev"
#        p2.vm.network :private_network, ip: "192.168.56.22", virtualbox__intnet: "clusternet"
#        p2.vm.synced_folder "./synced", "/synced"
#        p2.vm.provider :virtualbox do |vb|
#            vb.customize ["modifyvm", :id, "--memory", "512"]
#        end
#    end

    config.vm.define :m1 do |m1|
        m1.vm.box     = "centos65-x86_64-20140116"
        m1.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m1.vm.hostname = "m1.local.dev"
        m1.vm.network :private_network, ip: "192.168.56.31", virtualbox__intnet: "clusternet"
        m1.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m1.vm.provision :shell, :path => "./files/m1.sh"
    end

    config.vm.define :m2 do |m2|
        m2.vm.box     = "centos65-x86_64-20140116"
        m2.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m2.vm.hostname = "m2.local.dev"
        m2.vm.network :private_network, ip: "192.168.56.32", virtualbox__intnet: "clusternet"
        m2.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m2.vm.provision :shell, :path => "./files/m2.sh"
    end

    config.vm.define :m3 do |m3|
        m3.vm.box     = "centos65-x86_64-20140116"
        m3.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m3.vm.hostname = "m3.local.dev"
        m3.vm.network :private_network, ip: "192.168.56.33", virtualbox__intnet: "clusternet"
        m3.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m3.vm.provision :shell, :path => "./files/m3.sh"
    end
    

end

# If you have `vagrant up`ed the machine and just want to run salt again, super useful:
# time sudo salt-call state.highstate --local -l debug 2>&1 | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; }'