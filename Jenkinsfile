pipeline {
    agent { label 'NODE1' }
    triggers { pollSCM('* * * * *') }
    stages {
        stage('SourceCode') {
            steps {
                git branch: 'declarative', url: 'https://github.com/InnaPavan/spring-petclinic.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
         stage('run java application') {
            steps {
                sh 'java -jar **/spring-petclinic-2.7.0-SNAPSHOT.jar &'
            }
        }
        stage('Archive and Test Results') {
            steps {
               junit '**/surefire-reports/*.xml'
               archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
            }
        }
    }
}