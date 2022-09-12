pipeline {
    agent any
    stages { 
        stage('SCM Checkout') {
            steps{
            git url: 'https://github.com/InnaPavan/spring-petclinic.git', branch: "main"
            }
        }

        stage('Build package') {
            steps{
                sh '/opt/gradle-6.8.3/bin/gradle clean build'
            }
        }

        stage('push to nexus') {
            steps {  
                  nexusArtifactUploader artifacts: [
                      [
                         artifactId: 'spring-petclinic', 
                         classifier: '', 
                         file: 'build/libs/spring-petclinic-2.6.5.jar', 
                         type: 'jar'
                     ]
               ], 
               credentialsId: 'nexus', 
               groupId: 'org.springframework.samples', 
               nexusUrl: '3.8.200.69:8081', 
               nexusVersion: 'nexus3', 
               protocol: 'http', 
               repository: 'maven-releases', 
               version: '2.6.5'
            }
        }
    }
}
