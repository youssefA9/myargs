 pipeline {

     agent any
		
		stages {
			stage('Clone repo') {
				steps {
                git branch: 'main', credentialsId: 'CI_bitbucket_with_password', url: 'https://github.com/youssefA9/myargs.git'
            }
        }



        stage ('Build test Docker') {
            steps {
                script {
				bat 'docker build -t testdocker ./'
				
                     }
            }
        }
        
            stage('Entry Stage'){
      parallel {
        stage ('Run Jmeter Docker') {
            steps {
				// script{
                // bat 'docker run -t -v D:\\Courses\\DevOps\\myargs\\results:/data testdocker %fileName%' 
                
				// }
                echo 'hello'
			}
        }
      
            stage ('parallel'){
                steps{
                    sleep time: 2500, unit: 'MILLISECONDS'
                    echo 'This is Parallelism'
                }
            }

        }}
	}
    post {
    always {
      //bat 'docker system prune --all -f'
      cleanWs()
      deleteDir()
      bat 'dir'
    }
  }	
    


 }