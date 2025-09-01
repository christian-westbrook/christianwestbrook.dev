pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Executing the Build stage'
                sh 'docker image build --tag christianwestbrook.dev:latest --build-arg ENV=prod . 2>&1'
            }
        }

        stage('Test') {
            steps {
                echo 'Executing the Test stage'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                echo 'Executing the Deploy stage'
                sh 'docker container stop christianwestbrook.dev 2>/dev/null || true'
                sh 'docker container rm christianwestbrook.dev 2>/dev/null || true'
                sh 'docker container run --detach --name christianwestbrook.dev --publish 80:80 --publish 443:443 --volume /etc/letsencrypt:/etc/letsencrypt christianwestbrook.dev:latest'
            }
        }
    }
}