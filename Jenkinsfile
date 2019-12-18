pipeline {
    agent any
    post {
      failure {
        updateGitlabCommitStatus name: 'build', state: 'failed'
      }
      success {
        updateGitlabCommitStatus name: 'build', state: 'success'
      }
    }
    options {
      gitLabConnection('rubiin')
    }
    triggers {
        gitlab(triggerOnPush: true, triggerOnMergeRequest: true, branchFilterType: 'All')
    }
    stages {
        stage('Build') {
            steps {
                sh './deploy.sh'

	          }
        }
    }
}
