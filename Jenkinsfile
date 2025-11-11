// Jenkinsfile - Phase 3 (FINAL)
pipeline {
    agent any
    tools {
        maven 'Maven'
        jdk 'JDK 11'
    }
    stages {
        stage('1. Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mayank37739/my-jenkins-project.git'
            }
        }
        stage('2. Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('3. SonarQube Analysis (SAST)') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=my-jenkins-project -Dsonar.host.url=http://host.docker.internal:9000 -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }

        // --- NEW STAGES BELOW ---

        stage('4. Build Docker Image') {
            steps {
                script {
                    // Build the Docker image and tag it
                    sh 'docker build -t my-app:latest .'
                }
            }
        }
        stage('5. Scan Image (Container Scan)') {
            steps {
                // This runs the Trivy scanner
                // --exit-code 1: If any HIGH or CRITICAL vuln is found, FAIL the pipeline.
                // This is your "security gate"!
                sh '''
                docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                aquasec/trivy image --severity HIGH,CRITICAL --exit-code 1 my-app:latest
                '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}