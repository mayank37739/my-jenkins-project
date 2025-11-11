// Jenkinsfile - Phase 2 (Corrected Host URL)
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
                    // *** THIS LINE IS NOW FIXED ***
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=my-jenkins-project -Dsonar.host.url=http://host.docker.internal:9000 -Dsonar.login=$SONAR_TOKEN'
                }
            }
        }
    }
    post {
        always {
            cleanWs() // Clean up the workspace
        }
    }
}