#!/bin/bash
# purpose download 
# tested by: Alina



echo "Update sources list..."
sudo apt update -y
echo "Done!"

echo "Upgrade..."
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y
echo "Done!"

echo "Install Java 17 JDK"
sudo DEBIAN_FRONTEND=noninteractive apt install openjdk-17-jdk -y
echo "Done!"

echo "Install Maven"
sudo DEBIAN_FRONTEND=noninteractive apt-get install maven -y
echo "Done!"

echo "Install MySQL client for testing..."
sudo apt install mysql-client-core-8.0 -y
echo "Done!"

echo "Clone GitHub repository..."
cd /home/ubuntu
git clone https://github.com/Alina858/library-java-deployment.git
echo "Done!"

echo "Set ownership of cloned repo..."
sudo chown -R ubuntu:ubuntu /home/ubuntu/library-java-deployment
echo "Done!"

echo "Set Enviroment variables"
export DB_HOST="jdbc:mysql://"Public-Ip":3306/library"
export DB_USER= "appuser"
export DB_PASS= "SecurePass123!"
echo "Done!"

echo "Navigate to app folder and run..."
cd library-java-deployment/LibraryProject2
mvn spring-boot:run










