pipeline {
    agent any
    stages{
        stage('Docker') {
            steps {
                sh 'sudo usermod -aG docker $(whoami)'
                sh 'docker build -t "flask-app" .'
                sh 'docker run -d -p 5000:5000 "flask-app" flask-app'
            }
        }
        stage('Docker 2') {
            steps {
                sh 'cd "nginx"'
                sh 'docker build -t "nginx" .'
                sh 'docker run -d -p 80:80 "reverse-proxy" nginx'
            }
        }
    }
}