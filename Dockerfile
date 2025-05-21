FROM jenkins/jenkins:lts

USER root

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Donne accès à Docker pour l'utilisateur Jenkins
RUN usermod -aG docker jenkins

USER jenkins
