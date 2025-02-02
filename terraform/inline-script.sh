#install TRIVY
sudo apt-get -y install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy  -y 


#install Docker
sudo apt -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

sudo apt -y install docker-ce docker-ce-cli containerd.io

systemctl enable docker

sudo mkdir -p /home/jan/jenkins
sudo chown my-vm-admin /home/jan/jenkins

#run jenkins
sudo docker run -d -p 8080:8080 -p 50000:50000 --name jenkins --restart=on-failure -v /home/jan/jenkins:/var/jenkins_home jenkins/jenkins:lts-jdk17

#run sonarqube
sudo docker run -d -p 9000:9000 --name sonarqube sonarqube:lts-community

