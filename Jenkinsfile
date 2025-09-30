pipeline {
    agent any

    stages {
        stage('Cloner') {
            steps {
                git branch: 'main', url: 'https://github.com/mariemachouri2022/devops.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('SonarQube Analysis') {
              steps {
                withSonarQubeEnv('SonarQube') {
                  sh 'nvm run sonar'
                }
              }
        stage('Tests') {
            steps {
                sh 'mvn test'
            }
        }
    }
}
