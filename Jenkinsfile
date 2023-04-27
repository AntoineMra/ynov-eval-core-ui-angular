pipeline {
  agent any
  tools {
    nodejs "node18"
  }
  stages {
        stage('Fetch Source Code') {
            steps {
                checkout scm
            }
        }

        stage('Compile') {
            steps {
                sh 'npm install'
            }
        }
         stage('Push Docker Image') {
            steps {
                script {
                docker.withRegistry('nexus-ynov-sandbox.asys-cloud.fr/repository/ynov-docker/ynov-core-core-ui-angular-amarionneau', 'd0988e3f-63be-488d-93f9-3e9d9cdacfd4') {
                    def image_name = "${project.name}:${version}"
                    docker.build(image_name, ".")
                    docker.image(image_name).push()
                    }
                }
            }
         }
        stage('Lint') {
            steps {
                script {
                    sh 'npm run lint'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'npm run test'
                }
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build-client'
            }
        }
    }
  }
