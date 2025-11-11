// Jenkinsfile - Phase 1 (With Tools)
pipeline {
    agent any
    tools {
        // This tells Jenkins to use the Maven tool you configured
        maven 'Maven' 
    }
    stages {
        stage('1. Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mayank37739/my-jenkins-project.git'
            }
        }
        stage('2. Build') {
            steps {
                // Now this 'mvn' command will work
                sh 'mvn clean package'
            }
        }
    }
}