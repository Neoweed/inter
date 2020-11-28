#!groovy

pipeline {
  agent any
  options {
        timeout(time: 300, unit: 'SECONDS') 
    }
  stages 
    {
    stage('Build') {
      steps {
        sh 'docker build -t iast .'
      }

      }
    stage('Run and deploy Contrast') 
      {
              steps {
                sh 'docker run --rm -p 8080:8080 -t iast'

                
          }
        }

      }

    }