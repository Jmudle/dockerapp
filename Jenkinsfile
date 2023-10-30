pipeline {
    agent any
    stages{
        stage('Docker') {
            steps {
                sh 'sudo usermod -aG docker $(whoami)'
                sh 'sudo docker build -t "flaskapp" .'
                sh 'sudo docker run -d -p 5000:5000 flaskapp flaskapp'
            }
        }
        stage('Docker 2') {
            steps {
                sh 'cd "nginx"'
                sh 'sudo docker build -t "nginx" .'
                sh 'sudo docker run -d -p 80:80 reverse-proxy nginx'
            }
        }
    }
}