pipeline {
    agent any

    stages {
        stage('Récupération du code') {
            steps {
                checkout scm
            }
        }

        stage('Lancement de la commande Maven') {
            steps {
                sh 'mvn clean compile'
            }
        }
        stage('SonarQube Scan') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=squ_583cf301b1e0723f8d1897b26d85a8855f1e82c8'
            }
        }
     
       stage('mvn deploy'){
            steps {
                sh "mvn deploy"
            }
        }
        stage('BUILD DOCKER IMAGE') {
            steps { 
               
              sh 'docker build -t moetezbouchlaghem-5nids2-g10:tag .'
            }
        }

}
}
