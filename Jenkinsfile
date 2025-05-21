pipeline {
  agent any
  environment {
    DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t my-python-app .'
      }
    }
    stage('Test') {
      steps {
        sh 'echo "Running tests..."'
        // Ajouter ici des commandes de tests
      }
    }
    stage('Push to Docker Hub') {
      steps {
        sh 'docker login -u ${DOCKER_HUB_CREDENTIALS_USR} -p ${DOCKER_HUB_CREDENTIALS_PSW}'
        sh 'docker tag my-python-app ${DOCKER_HUB_CREDENTIALS_USR}/my-python-app:latest'
        sh 'docker push ${DOCKER_HUB_CREDENTIALS_USR}/my-python-app:latest'
      }
    }
    stage('Deploy') {
      steps {
        sh 'ssh user@remote-server "docker pull ${DOCKER_HUB_CREDENTIALS_USR}/my-python-app:latest"'
        sh 'ssh user@remote-server "docker stop my-python-app || true"'
        sh 'ssh user@remote-server "docker rm my-python-app || true"'
        sh 'ssh user@remote-server "docker run -d -p 5000:5000 --name my-python-app ${DOCKER_HUB_CREDENTIALS_USR}/my-python-app:latest"'
      }
    }
  }
}
