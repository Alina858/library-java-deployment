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

echo "Clone GitHub repository..."
cd /home/ubuntu
git clone https://github.com/Alina858/library-java-deployment.git
echo "Done!"

echo "Set Enviroment variables"
export DB_HOST="jdbc:mysql://localhost:3306/library"
export DB_USER= "appuser"
export DB_PASS= "SecurePass123!"

echo "Navigate to app folder and run..."
cd library-java-deployment/ProjectLibrary2
mvn spring-boot:run










