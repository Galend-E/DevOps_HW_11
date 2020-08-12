pipeline {
    agent {
        docker {
            image 'localhost:8123/build:1.1.0'
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
                sh 'docker build --tag=localhost:8123/boxfuse:staging .'
                sh 'docker login localhost:8123 -u admin -p qweasd'
                sh 'docker push localhost:8123/boxfuse:staging'
            }
        }
    }
}