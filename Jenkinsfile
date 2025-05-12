pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "macclare/my-webapp"
        WAR_FILE = "target/WebAppCal-0.0.6.war" 
        DOCKER_REGISTRY = "docker.io"
    }

    stages {
        stage('Checkout') {
            steps {
                
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run Maven to build the WAR file
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh """
                    docker build -t ${DOCKER_IMAGE} .
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container with Tomcat
                    sh """
                    docker run -d -p 8080:8080 ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy the WAR file to the running Tomcat server, you may want to SSH into the server
                echo 'Deploying the application...'
            }
        }
    }

    post {
        success {
            echo 'Deployment was successful!'
        }

        failure {
            echo 'There was an issue with the build/deployment.'
        }
    }
}
