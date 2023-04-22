pipeline {
    agent any
    stages {
        stage('Back-end') {
            steps {
                sh 'python -V'
            }
        }
        stage('Front-end') {
            steps {
                sh "node --version"
                // sh "${NODEJS_HOME}/bin/node --version"
                // sh "${NODEJS_HOME}/bin/npm --version"
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}