// Jenkinsfile - Phase 1 (Corrected)
pipeline {
    agent any // Run on any available Jenkins agent
    stages {
        stage('1. Checkout') {
            steps {
                // Change this to your project's Git URL
                git branch: 'main', url: 'https://github.com/mayank37739/my-jenkins-project.git'
            }
        }
        stage('2. Build') {
            steps {
                // This example uses Maven for a Java project
                sh 'mvn clean package'
            }
        }
    }
}