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
               stage("trivy test infra "){
                    steps {
                        sh 'trivy image sonarqube'
                        sh 'trivy image sonatype/nexus3'
                         sh ' trivy image prom/prometheus '
                    }
                }

           stage('Nmap Scan') {
            steps {

        sh 'nmap -p 80,443 192.168.33.10'
    }
       }

           stage('Nikto Scan') {
             steps {
        
        sh 'nikto -h 192.168.33.10 -p 80,443'
    }   
 }

               
           stage('Grafana/prometheus') {
            steps {
                sh 'docker start cc1f786d46e5'
                
            }

        } 

        

}

}



