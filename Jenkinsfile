pipeline {
    agent any

    environment {
    		DOCKERHUB_CREDENTIALS=credentials('iddockerhub')
    	}

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
         stage('OWASP Dependency Check') {
                    steps {
                        dependencyCheck additionalArguments: '--scan target/', odcInstallation: 'owasp'
                    }
                }
          

 

        stage('SonarQube Scan') {
            steps {
                sh 'mvn sonar:sonar -Dsonar.login=squ_583cf301b1e0723f8d1897b26d85a8855f1e82c8'
            }
        }
        stage("mockito"){
                    steps {
                        sh 'mvn -Dtest=mockito test'
                    }
                }
     
       stage('mvn deploy'){
            steps {
                sh "mvn deploy"
            }
       }

       stage('Docker Image') {
                   steps {
                       sh 'docker build -t moetezbouchlaghe-5nids2-g10 .'
                   }
       }

        stage('DOCKERHUB') {
                          steps {
                              sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                              sh 'docker tag moetezbouchlaghe-5nids2-g10 mboch/moetezbouchlaghe-5nids2g10:1.0.0'
                              sh 'docker push mboch/moetezbouchlaghe-5nids2g10:1.0.0'
                          }
                      }


       stage('Docker Compose') {
                   steps {
                       sh 'docker compose up -d'
                   }
       }
       stage('Junit') {
                   steps {
                       sh 'mvn -Dtest=Junit test'
                   }
               }
               
           stage('Grafana/prometheus') {
            steps {
                sh 'docker start cc1f786d46e5'
                sh 'docker start e896dcb30396'
            }

        } 

        

}

}



