pipeline {
    agent any
    stages{
        stage('Docker') {
            steps{
                sh 'sudo docker network new-network'
            }
            steps {
                sh 'sudo usermod -aG docker $(whoami)'
                sh 'sudo docker build -t "flaskapp" .'
                sh 'sudo docker run -d -p 5000:5000 --name flask-app --network new-network flaskapp'
            }
        }
        stage('Docker 2') {
            steps {
                sh 'cd "nginx"'
                sh 'sudo docker build -t "nginx" .'
                sh 'sudo docker run -d -p 80:80 --name proxy-pass --network new-network nginx'
            }
        }
    }
}