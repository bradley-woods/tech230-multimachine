#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

# Download key to trusted key set
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

# The key is read and stored to MongoDB root repo
echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Ensure all packages are installed prior to installing MongoDB
sudo apt-get update -y
sudo apt-get upgrade -y

# Install MongoDB
sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

# Start and enable MongoDB
sudo systemctl start mongod
sudo systemctl enable mongod

# Check status is running of the MongoDB server
sudo systemctl status mongod

# Edit /etc/mongod.conf file to change bindIp to 0.0.0.0
sudo sed -i "s,\\(^[[:blank:]]*bindIp:\\) .*,\\1 0.0.0.0," /etc/mongod.conf

# Restart then enable MongoDB
sudo systemctl restart mongod
sudo systemctl enable mongod