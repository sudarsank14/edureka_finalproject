pipeline{
    agent none
        stages{
            stage('checkout'){
                agent any
                steps{
                    git 'https://github.com/sasirekharameshbabu/edureka_finalproject.git'
                }
            }
            
            stage('Docker_Build'){
                agent any
                steps{
                    sh 'sudo docker build -t prsasirekha/edureka_final_project:latest .'
                }
            }
            
            stage('Docker_Push'){
                agent any
                steps{
                    withCredentials([string(credentialsId: 'Password', variable: 'Password')]) {
                        sh 'sudo docker login -u prsasirekha -p $Password'
                    }
                
                    sh 'sudo docker push prsasirekha/edureka_final_project:latest'
                }
            }
            stage('Docker_CleanUP'){
                agent any
                steps{
                    sh 'docker ps -f name=mycont -q | xargs --no-run-if-empty docker container stop'
                    sh 'docker container ls -a -fname=mycont -q | xargs -r docker container rm'
                }
            }
            stage('Docker_Run'){
                agent any
                steps{
                    sh 'sudo docker run --name mycont -d -p 8140:80 prsasirekha/edureka_final_project:latest'
                }
            }
            
            stage('Selenium_Test'){
                agent {label'windows_slave'}
                steps{
                    git 'https://github.com/sasirekharameshbabu/edureka_finalproject.git'
                    bat 'mvn test'
                }
            }            
            
        }   
}
