pipeline {
    agent any
    stages {
        stage('Docker Setup') {
            steps {
                script {
                    sh 'sudo docker network create new-network'
                }
            }
        }
        stage('Build and Run Flask App') {
            steps {
                script {
                    sh 'sudo usermod -aG docker $(whoami)'
                    sh 'sudo docker build -t flaskapp .'
                    sh 'sudo docker run -d -p 5000:5000 --name flask-app --network new-network flaskapp'
                }
            }
        
        }
    }
}
