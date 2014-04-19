
Vagrant.configure('2') do |config|

    config.vm.define :ha do |ha|
        ha.vm.box     = "centos65-x86_64-20140116"
        ha.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        ha.vm.hostname = "ha.local.dev"
        # This will let you hit http://127.0.0.1:8080/haproxy/stats in your browser
        ha.vm.network "forwarded_port", guest:   80, host: 8080
        # And this will let you hit 127.0.0.1:3306 with your favorite mysql client -- each time going to a new node
        ha.vm.network "forwarded_port", guest: 3306, host: 3306
        ha.vm.network :private_network, ip: "192.168.56.20", virtualbox__intnet: "clusternet"
        ha.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        ha.vm.provision :shell, :path => "./files/hap.sh"
    end

    config.vm.define :m1 do |m1|
        m1.vm.box     = "centos65-x86_64-20140116"
        m1.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m1.vm.hostname = "m1.local.dev"
        m1.vm.network :private_network, ip: "192.168.56.31", virtualbox__intnet: "clusternet"
        m1.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m1.vm.provision :shell, :path => "./files/pxc-node.sh", :args => ['1', '192.168.56.31']
    end

    config.vm.define :m2 do |m2|
        m2.vm.box     = "centos65-x86_64-20140116"
        m2.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m2.vm.hostname = "m2.local.dev"
        m2.vm.network :private_network, ip: "192.168.56.32", virtualbox__intnet: "clusternet"
        m2.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m2.vm.provision :shell, :path => "./files/pxc-node.sh", :args => ['2', '192.168.56.32']
    end

    config.vm.define :m3 do |m3|
        m3.vm.box     = "centos65-x86_64-20140116"
        m3.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        m3.vm.hostname = "m3.local.dev"
        m3.vm.network :private_network, ip: "192.168.56.33", virtualbox__intnet: "clusternet"
        m3.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        m3.vm.provision :shell, :path => "./files/pxc-node.sh", :args => ['3', '192.168.56.33']
    end
    

end
