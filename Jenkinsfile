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
                    sh 'docker service create --name nginx-service --replicas 3  nginx:latest'
                }
            }
        }

        stage('Send Email Notification') {
            steps {
                script {
                    emailext body: 'emailext body: 'EMAIL FROM JENKINS', subject: '"YOUR PIPELINE HAS BUILD SUCCCESSFULLY"', to: 'uganesh43@gmail.com'
                }
            }
        }
    }
}

