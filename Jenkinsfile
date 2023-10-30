pipeline {
    agent any
    stages {
        stage('Docker Setup') {
            steps {
                script {
                    // Create a Docker network
                    sh 'sudo docker network create new-network'
                }
            }
        }
        stage('Build and Run Flask App') {
            steps {
                script {
                    // Add the current user to the docker group
                    sh 'sudo usermod -aG docker $(whoami)'

                    // Build and run the Flask app container
                    sh 'sudo docker build -t flaskapp .'
                    sh 'sudo docker run -d -p 5000:5000 --name flask-app --network new-network flaskapp'
                }
            }
        }
        stage('Build and Run NGINX Proxy') {
            steps {
                script {
                    // Change directory to nginx
                    sh 'cd nginx'

                    // Build and run the NGINX proxy container
                    sh 'sudo docker build -t nginx .'
                    sh 'sudo docker run -d -p 80:80 --name proxy-pass --network new-network nginx'
                }
            }
        }
    }
}
