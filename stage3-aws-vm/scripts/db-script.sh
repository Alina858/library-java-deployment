#!/bin/bash
# purpose download 
# tested by: Alina


echo "Update sources list..."
sudo apt update -y
echo "Done!"

echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done!"


echo "Install mysql"
sudo DEBIAN_FRONTEND=noninteractive apt install mysql-server -y
echo "Done!"

echo "Start mysql..."
sudo systemctl start mysql
sudo systemctl enable mysql
echo "Done!"

sleep 10

echo "Download mysql file"
cd /tmp
wget https://raw.githubusercontent.com/Alina858/library-java-deployment/refs/heads/main/library.sql
echo "Done!"


# Create database and user
sudo mysql <<EOF
CREATE DATABASE library;
CREATE USER 'appuser'@'%' IDENTIFIED BY 'SecurePass123!';
GRANT ALL PRIVILEGES ON library.* TO 'appuser'@'%';
FLUSH PRIVILEGES;
USE library;
SOURCE /tmp/library.sql;
EOF

echo "Configure MySQL to accept remote connections"
sudo sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf

echo "Restart MySQL"
sudo systemctl restart mysql
echo "Database VM setup complete!"


