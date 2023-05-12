# Configure 2 so that 2 virtual machines are created. Note, we need a new 'do' block. 'bionic64' is an Ubuntu 18.04 64-bit operating system.
Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    # configure the app VM settings
    app.vm.box = "ubuntu/bionic64"
    app.vm.network "private_network", ip:"192.168.10.100"

    # provision the VM to have nginx web server
    app.vm.provision "shell", path: "provision_app.sh", privileged: false

    # sync app folder from local machine to the VM
    app.vm.synced_folder "app", "/home/vagrant/app"
  end

  config.vm.define "db" do |db|
    # configure the db VM settings
    db.vm.box = "ubuntu/bionic64"
    db.vm.network "private_network", ip:"192.168.10.150"

    # provision the VM to have MongoDB database
    db.vm.provision "shell", path: "provision_db.sh", privileged: false

    # sync environment folder from local machine to the VM
    db.vm.synced_folder "environment", "/home/vagrant/environment"
  end
end
