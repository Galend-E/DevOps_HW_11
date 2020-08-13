 pipeline {
    agent none

    tools {
        maven 'm3'
    }

    stages {
        stage ('Build docker image') {
            agent {
                docker {
                    image 'build:2.1.0'
                    args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
                    registryUrl 'http://192.168.212.91:8123'
                    registryCredentialsId 'f2e37da6-6333-4e0a-8631-86ee69ca3494'
                    }
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
            }
        }
        stage ('Run boxfuse container') {
            agent any
            steps {
                sh 'ssh root@192.168.212.94 docker pull 192.168.212.91:8123/boxfuse:staging'
                sh 'ssh root@192.168.212.94 docker run -d -p 8081:8080 192.168.212.91:8123/boxfuse:staging'
            }
        }
    }
}