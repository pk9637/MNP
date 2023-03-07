pipeline {
  agent any
  stages {
    stage('Stage1') {
      parallel {
        stage('Stage1') {
          steps {
            sh 'echo "Stage1"'
          }
        }

        stage('Paralle1.1') {
          steps {
            sh '''sleep 10
echo "Parallel stage 1.1"'''
          }
        }

      }
    }

    stage('Stage2') {
      parallel {
        stage('Stage2') {
          steps {
            sh 'echo "Stage2"'
          }
        }

        stage('Parallel2.1') {
          steps {
            sh '''sleep 10
echo "Parallel Stage 2.1"'''
          }
        }

      }
    }

  }
}