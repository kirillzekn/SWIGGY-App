#install TRIVY
sudo apt-get -y install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy  -y 


#install Docker
# sudo apt-get update
# sudo apt-get install docker.io -y
# sudo usermod -aG docker ubuntu
# sudo newgrp docker
# sudo chmod 777 /var/run/docker.sock

#install Docker
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update -7
sudo apt-get install ca-certificates curl -y
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y



#create homedir for jenkins
#sudo mkdir -p /var/jenkins_home
#sudo chown -R 1000:1000 /var/jenkins_home

#clean up all docker exited containers
sudo docker rm -v $(docker ps --filter status=exited -q)

#run jenkins
sudo docker run -d -p 8080:8080 --name jenkins jenkins/jenkins:lts

#run sonarqube
sudo docker run -d -p 9000:9000 --name sonarqube sonarqube:lts-community

