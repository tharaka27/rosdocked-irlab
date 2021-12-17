pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
          echo 'Building...'
          sh "chmod +x -R ${env.WORKSPACE}"
          sh "sudo usermod -a -G docker jenkins"
          sh "./BASE_CPU/build.sh"
      }
      post{
        failure {
          echo "Build failed"
        }
      }
    }

    stage('Test') {
      steps {
          echo 'Testing...'
      }
    }
  
    stage('Deploy') {
      steps {
          echo 'Deploying...'
      }
    }
  }
}


