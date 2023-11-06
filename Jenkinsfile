pipeline {
    agent any
    environment {
        DOCKER_LOGIN=credentials('DOCKER_LOGIN')
    }
    stages {
        stage('Test')
            steps {
                script {
                    sh 'echo "The Tests Are Running"'
                }
            }
        stage('Build and Run Flask App') {
            steps {
                script {
                    sh 'sudo docker stop flask-app'
                    sh 'sudo docker rm flask-app'
                    sh 'sudo usermod -aG docker $(whoami)'
                    sh 'sudo docker build -t jamiemudle01/flaskapp .'
                    sh 'sudo docker login -u ${DOCKER_LOGIN_USR} -p ${DOCKER_LOGIN_PSW}'
                    sh 'sudo docker push jamiemudle01/flaskapp'
                    sh 'sudo docker run -d -p 5000:5000 --name flask-app --network new-network jamiemudle01/flaskapp'
                }
            }
        
        }
    }
}
