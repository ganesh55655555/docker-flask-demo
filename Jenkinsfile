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
                    sh 'docker service rm nginx:$BUILD_NUMBER|| true'
                }
            }
        }
         stage('Delploy new Docker Container') {
            steps {
                script {
                    sh 'docker service create --name nginx-service-new-$BUILD_NUMBER --replicas 3 nginx:latest'
                      options {
                timeout(time: 3, unit: 'MINUTES') // Timeout for this specific stage
   }
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
