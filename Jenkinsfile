pipeline {
    agent any

    options {
        timeout(time: 5, unit: 'MINUTES') // Timeout for the entire pipeline run
    }
    
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t nodejs ."
                }
            }
        }
        
    
    post {
        success {
            emailext body: 'FROM JENKINS', subject: 'YOUR JENKINS PIPELINE IS READY', to: 'uganesh43@gmail.com'
        }
    }
}
