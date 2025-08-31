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
                sh 'docker container stop christianwestbrook.dev 2>/dev/null || true'
                sh 'docker container rm christianwestbrook.dev 2>/dev/null || true'
                sh 'docker container run --detach --name christianwestbrook.dev --publish 3000:3000 christianwestbrook.dev:latest'
            }
        }
    }
}