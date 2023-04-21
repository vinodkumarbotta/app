pipeline {
    agent any 
    stages {
        stage('Back-end') {
            steps {
                sh 'python -V'
            }
        }
        stage('Front-end') {
            environment {
                NODEJS_HOME = tool name: 'npmpkg', type: 'nodejs'
            }
            steps {
                sh "${NODEJS_HOME}/bin/node --version"
                sh "${NODEJS_HOME}/bin/npm --version"
            }
        }
    }
}