FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

FROM jenkins/jenkins:lts

USER root

# Installer Docker dans l'image Jenkins
RUN apt-get update && apt-get install -y docker.io

# Ajouter Jenkins au groupe docker
RUN groupadd -f docker && usermod -aG docker jenkins

USER jenkins
