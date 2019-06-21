pipeline {
    agent {
        docker {
            image 'node:6-alpine'
            args '-p 3000:3000'
        }
    }
    environment {
       CI = 'true'
   }
   stages {
      stage('env') {
        steps {
          notifyStarted()
        }
      }
      stage('Build') {
          steps {
              sh 'npm install'
          }
      }
      stage('Test') {
          steps {
              sh './jenkins/scripts/test.sh'
          }
      }
      stage('Deliver') {
          steps {
              sh './jenkins/scripts/deliver.sh'
              input message: 'Finished using the web site? (Click "Proceed" to continue)'
              sh './jenkins/scripts/kill.sh'
          }
      }
    }
    post {
      success {
        notifySuccessful()
      }
      failure {
        notifyFailed()
      }
    }
}

def notifyStarted() {
  slackSend (color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifySuccessful() {
  slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifyFailed() {
  slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}
