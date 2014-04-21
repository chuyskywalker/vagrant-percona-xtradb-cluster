Vagrant.configure('2') do |config|

    # Use the same centos6.5 box for everyone
    config.vm.box     = "centos65-x86_64-20140116"
    config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
    
    # Everyone gets the common install parts
    config.vm.provision :shell, :path => "./files/common.sh"

    config.vm.define :ha do |ha|
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

    config.vm.define :cc do |cc|
        cc.vm.hostname = "cc.local.dev"
        # This will let you hit http://127.0.0.1:9090/clustercontrol in your browser
        cc.vm.network "forwarded_port", guest:   80, host: 9090
        cc.vm.network :private_network, ip: "192.168.56.40", virtualbox__intnet: "clusternet"
        cc.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "512"]
        end
        cc.vm.provision :shell, :path => "./files/cc.sh"
    end
    
    # Setup many slaves -- don't setup more than 9 or the IP allocation will break since "192.168.56.310" is not a valid IP :D
    (1..5).each do |i|
        config.vm.define "m#{i}" do |pxcnode|
            pxcnode.vm.hostname = "m#{i}.local.dev"
            pxcnode.vm.network :private_network, ip: "192.168.56.3#{i}", virtualbox__intnet: "clusternet"
            pxcnode.vm.provider :virtualbox do |vb|
                vb.customize ["modifyvm", :id, "--memory", "384"]
            end
            pxcnode.vm.provision :shell, :path => "./files/pxc-node.sh", :args => ["#{i}", "192.168.56.3#{i}"]
        end
    end

end
