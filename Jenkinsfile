pipeline {
    agent any

    tools {
        jdk 'JAVA_HOME'     // Nom de ton JDK configuré dans Jenkins
        maven 'M2_HOME'     // Nom de Maven configuré dans Jenkins
    }

    environment {
        // Définit le nom du serveur SonarQube que tu as configuré dans Jenkins
        SONARQUBE_SERVER = 'SonarQube'
    }

    stages {
        stage('Checkout') {
            steps {
                echo '📦 Clonage du dépôt...'
                git branch: 'main', url: 'https://github.com/mariemachouri2022/devops.git'
            }
        }

        stage('Build') {
            steps {
                echo '⚙️ Compilation du projet...'
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Exécution des tests...'
                sh 'mvn test'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo '🔍 Analyse SonarQube...'
                withSonarQubeEnv("${SONARQUBE_SERVER}") {
                    sh 'mvn sonar:sonar'
                }
            }
        }

        stage("Quality Gate") {
            steps {
                // Attente du résultat du Quality Gate
                timeout(time: 1, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline terminée avec succès !'
        }
        failure {
            echo '❌ Échec du pipeline !'
        }
    }
}