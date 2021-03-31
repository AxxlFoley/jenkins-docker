pipeline {
  environment {
    registry = "registry.myhomehub.de/myhomehub-jenkins"
    registryCredential = ''
    dockerImage = ''
  }
  agent any
  stages {
   
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":latest", "--no-cache"
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
