pipeline {
     agent { 
                label 'docker-slave'
            }
    stages {
        stage('Back-end') {
            steps {
                sh 'python -V'
            }
        }
        stage('Front-end') {
            steps {
                sh 'node --version'
            }
        }
    }
}