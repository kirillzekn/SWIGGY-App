# SWIGGY-App
DevOps Real-time Project | Deployment of SWIGGY App by ZEKN

1. High level architecture:
   ![image](https://github.com/user-attachments/assets/627d177e-ccca-471a-811b-e8795f60bc88)

2. In addition to the default plugins, the following Jenkins plugins need to be installed:
- Eclipse Temurin
- Pipeline Stage View
- SonarQube Scanner
- NodeJS
- OWASP Dependency Check
- Docker
- Docker commons
- Docker pipeline
- Docker API
- Docker build Step

3. After plugin installation configure Jenkins tools by installing:
- JDK 17.0.X, from adoptium.net
- GIT
- SonarQube, latest version
- NodeJS, latest version
- Docker, from docker.com
- Dependency Check, latest version

4. Configure SonarQube
- Create a SQ token, under Administration ->  Security -> User
- Under Jenkins -> Manage Jenkins -> Credentials -> Global -> Add secret text with SQ token
- In SQ Administration -> Configuration -> Create Web Hook by providing Jenkins URL/sonarqube-webhook/
- In Jenkins -> System Configuratrion -> System add SQ installation by providing SQ URL with port, for Auth use SQ token

5. Configure Docker Hub credentials in Jenkins
- using DockerHub username configure credentials: Manage Jenkins -> Credentials (Security section) -> Add new credentials (global scope)

6. Create a Job
- New item -> pipeline -> write a script.

7. Script
- Tools to be used: jdk, nodeJS
- Declare environment variable for sonar qube location using SCANNER_HOME
- Clean workspace
- Checkout code from github repository with source code
- Perform sonarQube analysis
- Quality gate
- Install dependency: npm
- Perform source code scan by OWASP
- Perform source code scan by Trivy 
- Docker build and push
- Scan docker image with Trivy
- Deploy container
