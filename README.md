# CI/CD Pipeline with Jenkins

This project demonstrates a complete CI/CD pipeline using Jenkins, Docker, and Flask.

## Project Structure

- `app.py`: Simple Flask application
- `requirements.txt`: Python dependencies
- `Dockerfile`: Instructions to containerize the application
- `Jenkinsfile`: CI/CD pipeline definition
- `test_app.py`: Basic tests for the application

## Setup Instructions

### 1. Local Development

```bash
# Clone the repository
git clone https://github.com/your-username/your-repo.git
cd your-repo

# Install dependencies
pip install -r requirements.txt

# Run the application
python app.py

# Run tests
pytest
```

### 2. Docker Setup

```bash
# Build the Docker image
docker build -t my-python-app .

# Run the container
docker run -d -p 5000:5000 my-python-app

# Test the application
curl http://localhost:5000
```

### 3. Jenkins Setup

1. Install Jenkins on your server
2. Add Docker Hub credentials in Jenkins
   - Go to "Manage Jenkins" > "Manage Credentials"
   - Add a new credential with ID "docker-hub-credentials"
3. Create a new Pipeline job in Jenkins
4. Configure the job to use your Git repository
5. The Jenkinsfile will automatically define the pipeline stages

## Pipeline Stages

1. **Build**: Builds the Docker image
2. **Test**: Runs automated tests
3. **Push to Docker Hub**: Uploads the image to Docker Hub
4. **Deploy**: Deploys the application to a remote server
