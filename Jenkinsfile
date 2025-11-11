// Jenkinsfile - Phase 1
pipeline {
    agent any // Run on any available Jenkins agent
    stages {
        stage('1. Checkout') {
            steps {
                // Change this to your project's Git URL
                git 'https://github.com/mayank37739/my-jenkins-project.git'
            }
        }
        stage('2. Build') {
            steps {
                // This example uses Maven for a Java project
                // For Node.js: sh 'npm install'
                // For Python: sh 'pip install -r requirements.txt'
                sh 'mvn clean package'
            }
        }
    }
}