// Jenkinsfile - Phase 2
pipeline {
    agent any
    tools {
        // This 'SonarScanner' must match the name you set in Global Tool Configuration
        maven 'Maven' 
        jdk 'JDK 11' // You'll need to configure this tool just like you did for Maven
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
                // 'SonarQube' must match the server name you set in Configure System
                withSonarQubeEnv('SonarQube') {
                    // This command runs the scanner
                    // Note: I've updated this command from your guide to be more robust for Maven
                    sh 'mvn clean verify sonar:sonar -Dsonar.projectKey=my-jenkins-project -Dsonar.host.url=http://localhost:9000 -Dsonar.login=$SONAR_TOKEN'
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