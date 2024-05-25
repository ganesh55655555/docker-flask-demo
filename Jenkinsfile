pipeline {
    agent any

    options {
        timeout(time: 5, unit: 'MINUTES') // Timeout for the entire pipeline run
    }
    
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t nodejs ."
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container
                    sh "docker run -d -p 3000:3000 nodejs"
                }
            }
        }
    }
}
