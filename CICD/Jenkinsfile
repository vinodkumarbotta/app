pipeline {
    agent any
    stages {
        stage('Front-end') {
            steps {
                dir('frontend'){ 
                   sh "ls -lrt"
                }
            }
        }
        stage('Back-end') {
            steps {
                dir('frontend'){ 
                   sh "ls -lrt"
                }
            }
        }
        
    }
    post {
        always {
            cleanWs()
        }
    }
}