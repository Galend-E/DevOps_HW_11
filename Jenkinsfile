pipeline {
    agent {
        docker {
            image 'build:1.1.0'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
            registryUrl 'http://192.168.212.91:8123'
            registryCredentialsId 'f2e37da6-6333-4e0a-8631-86ee69ca3494'
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
        stage ('Build and push docker image') {
            steps {
                sh 'docker build --tag=192.168.212.91:8123/boxfuse:staging .'
                sh 'docker push 192.168.212.91:8123/boxfuse:staging'
            }
        }
        stage ('')
    }
}