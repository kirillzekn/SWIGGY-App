#install TRIVY
sudo apt-get -y install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy  -y 


#install Docker
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker ubuntu
newgrp docker
sudo chmod 777 /var/run/docker.sock

#run jenkins
docker run -d -p 8080:8080 --name jenkins jenkins/jenkins:lts

#run sonarqube
docker run -d -p 9000:9000 --name sonarqube sonarqube:lts-community

