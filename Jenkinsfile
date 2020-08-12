pipeline {
    agent {
        docker {
            image '192.168.212.91:8123/build:1.1.3'
        }
    }

    tools {
        maven 'm3'
    }

    stages {
        stage ('Git clone') {
            steps {
                git 'https://github.com/Galend-E/boxfuse.git'
            }
        }
        stage ('Build java project') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('Build docker image') {
            steps {
                sh 'docker build --tag=192.168.212.91:8123/boxfuse:staging .'
                sh 'docker login 192.168.212.91:8123 -u admin -p qweasd'
                sh 'docker push 192.168.212.91:8123/boxfuse:staging'
            }
        }
    }
}