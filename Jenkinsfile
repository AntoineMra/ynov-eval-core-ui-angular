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
    }
  }
