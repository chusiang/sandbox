pipeline {
  agent any 
  
  stages {
    stage('Shell Script') { 
      steps { 
        sh 'cd bash'
        sh 'make' 
      }
    }
    stage('Python') { 
      steps { 
        sh 'cd python'
        sh 'make' 
      }
    }
  }
}
