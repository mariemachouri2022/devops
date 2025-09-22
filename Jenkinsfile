pipeline {
    agent any

    stages {
        stage('Cloner') {
            steps {
                git branch: 'master', url: 'https://github.com/<ton-user>/<ton-repo>.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Tests') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
