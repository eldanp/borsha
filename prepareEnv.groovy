pipeline {
    agent any

    stages {
       stage('gitlab') {
          steps {
             echo 'Notify GitLab'
             updateGitlabCommitStatus name: 'build', state: 'pending'
             updateGitlabCommitStatus name: 'build', state: 'success'
			 
          }
       }
       stage('last_commit_id') {
          steps {
			  PAYLOAD=$(cat << 'JSON'
			 {
			   "branch": "master",
			   "commit_message": "some commit message",
			   "actions": [
			 	{
			 	  "action": "last_commit_id",
			 	  "file_path": "Test-eldan/cratepipline"
			 	}
			   ]
			 }
			 JSON
			 )
			 curl --request POST --header "PRIVATE-TOKEN: <your_access_token>" --header "Content-Type: application/json" \
			 	 --data "$PAYLOAD" "https://github/"
          }
       }
	   stage ('build artifact '){
		  steps {
			 echo "download from github and crate artifact"
			 curl {https://github/} | 7z a -tzip Test-eldan/cratepipline
	      {
	   }
	   stage ('upload artifact to ripo'){
          steps {
			 echo "upload artifact to ripo"
          }
	   }
    }
 }
 
 
