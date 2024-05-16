pipeline {
    agent any

    options {
        timeout(time: 20, unit: 'SECONDS') // Timeout for the entire pipeline run
    }

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
                    sh 'docker service rm nginx:$BUILD_NUMBER || true'
                }
            }
        }

        stage('Deploy New Docker Container') {
            steps {
                script {
                    sh 'docker service create --name nginx-service-new-$BUILD_NUMBER --replicas 2 nginx:latest'
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
