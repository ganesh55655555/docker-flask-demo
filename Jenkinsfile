pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t nginx:$BUILD_NUMBER .'
                }
            }
        }

stage('Remove Older Docker Containers') {
            steps {
                script {
                    sh 'docker service rm nginx-service || true'
                }
            }
        }
         stage('Delploy new Docker Container') {
            steps {
                script {
                    
                }
            }
        }
    }
    
    post {
        success {
            emailext body: 'FROM JENKINS', subject: 'YOUR JENKINS PIPELINE IS READY', to: 'uganesh43@gmail.com'
        }
    }
}
