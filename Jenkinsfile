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
                    sh 'docker service create --name nginx-service$BUILD_NUMBER --replicas 3  nginx:latest'
                }
            }
        }

        
            post  {
                success {
                    emailext body: 'FROM JENKINS', subject: 'YOUR JENKINS PIPELINE IS READY', to: 'uganesh43@gmail.com'
                }
            }
        }
    }
}

