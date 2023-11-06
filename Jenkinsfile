pipeline {
    agent any
    environment {
        DOCKER_LOGIN=credentials('DOCKER_LOGIN')
    }
    stages {
        stage('Docker Setup') {
            steps {
                script {
                    sh 'sudo docker network prune -y'
                    sh 'sudo docker network create new-network'
                }
            }
        }
        stage('Build and Run Flask App') {
            steps {
                script {
                    sh 'sudo docker stop flask-app'
                    sh 'sudo docker rm flask-app'
                    sh 'sudo usermod -aG docker $(whoami)'
                    sh 'sudo docker build -t jamiemudle01/flaskapp .'
                    sh 'sudo docker push jamiemudle01/flaskapp'
                    sh 'sudo docker login -u ${DOCKER_LOGIN_USR} -p ${DOCKER_LOGIN_PSW}'
                    sh 'sudo docker run -d -p 5000:5000 --name jamiemudle01/flask-app --network new-network jamiemudle01/flaskapp'
                }
            }
        
        }
    }
}
