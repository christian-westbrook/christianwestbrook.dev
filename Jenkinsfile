pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Executing the Build stage'
                sh 'docker image build -t christianwestbrook.dev:latest . 2>&1'
            }
        }

        stage('Test') {
            steps {
                echo 'Executing the Test stage'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Executing the Deploy stage'
            }
        }
    }
}