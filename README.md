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
- Create a SQ token, under Administration -> User -> Security
- Under Jenkins -> Manage Jenkins -> Credentials -> Global -> Add secret text with SQ token
- In SQ Administration -> Configuration -> Create Web Hook by providing Jenkins URL/sonarqube-webhook/
- In Jenkins -> System Configuratrion -> System add SQ installation by providing SQ URL with port, for Auth use SQ token

5. Configure Docker Hub credentials in Jenkins
- 