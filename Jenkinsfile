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
                docker rmi -f $(docker images -f "dangling=true" -q)
                docker build . -t testimage
                docker run -d -p 8000:8000 --name testimage testimage


	          }
        }
    }
}
