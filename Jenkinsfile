pipeline {
    agent any

    options {
        timeout(time: 5, unit: 'MINUTES') // Timeout for the entire pipeline run
    }
    
    stages {
        stage('Preparation') {
            steps {
                script {
                    def commitHash = env.GIT_COMMIT.take(7)
                    env.COMMIT_HASH = commitHash
                }
            }
        }
        
        stage('Remove Existing Docker Containers and Images') {
            steps {
                script {
                    sh "docker service rm nginx-service-new-* || true"
                    sh 'docker rmi $(docker images -q --filter reference=nginx) --force || true'
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def commitHash = env.COMMIT_HASH
                    sh "docker build -t nginx:${commitHash} ."
                }
            }
        }
        
        stage('Deploy New Docker Container') {
            steps {
                script {
                    def commitHash = env.COMMIT_HASH
                    sh "docker service create --name nginx-service-new-${commitHash} --replicas 1 nginx:latest"
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
