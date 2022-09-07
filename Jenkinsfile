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
                sh '/opt/gradle-6.8.3/bin/gradle publish'
            }
        }
    }
}
