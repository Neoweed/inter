pipeline {
  agent any
  options {
        timeout(time: 300, unit: 'SECONDS') 
    }
 	environment {
        path11 = sh(returnStdout: true, script: 'pwd')
    }
  stages 
    {
    stage('SNYK') {
      steps {
		snykSecurity failOnIssues: false, snykInstallation: 'pulgin', snykTokenId: 'snyk'     
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '/var/lib/jenkins/workspace/final', reportFiles: 'final_snyk_report.html', reportName: 'SAST Report', reportTitles: ''])
	    }

		  }
    stage('Build and push docker images') 
			{
      				steps {
        				sh 'docker build -t akhilank1937/first .'

        				withDockerRegistry([ credentialsId: "DockerHub", url: "" ]) {
         						sh 'docker push akhilank1937/first:latest'
        				  }
    			}
    		}
      }
    }