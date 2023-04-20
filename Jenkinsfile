pipeline {
    agent none
    stages {
        stage('Back-end') {
            agent {
                docker { image 'python:3' }
            }
            steps {
                sh 'python -V'
            }
        }
        stage('Front-end') {
            agent {
                docker { image 'node:16.13.1-alpine' }
            }
            steps {
                sh 'node --version'
            }
        }
    }
}