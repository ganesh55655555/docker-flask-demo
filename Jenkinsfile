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

        stage('Deploy Docker Container') {
            steps {
                script {
                    sh 'docker service create --name nginx-service --replicas 3 --publish published=80,target=80 --detach=false nginx:latest'
                }
            }
        }

        stage('Send Email Notification') {
            steps {
                script {
                    emailext body: 'NGINX Docker container deployed successfully!',
                             subject: 'Deployment Status',
                             to: 'uganesh43@gmail.com'
                }
            }
        }
    }
}

