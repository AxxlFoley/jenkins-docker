pipeline {
  environment {
    registry = "registry.myhomehub.de/myhomehub-jenkins"
    registryCredential = ''
    dockerImage = ''
  }
  agent any
  triggers {
     cron('@daily')
  }
  stages {
   
    stage('Building image') {
      steps{
        script {
          sh "docker pull jenkins/jenkins:latest"
          dockerImage = docker.build("registry.myhomehub.de/myhomehub-jenkins:latest")
        }
      }
    }

  
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( 'https://registry.myhomehub.de/myhomehub-api', '' ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:latest"
      }
    }
  }
}
