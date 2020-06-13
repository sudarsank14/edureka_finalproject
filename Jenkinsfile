pipeline{
    agent none
        stages{
            stage('checkout'){
                agent any
                steps{
                    git 'https://github.com/sudarsank14/edureka_finalproject.git'
                }
            }
            
            stage('Docker_Build'){
                agent any
                steps{
                    sh 'sudo docker build -t sudarsank/edureka_final_project:latest .'
                }
            }
            
            stage('Docker_Push'){
                agent any
                steps{
                    withCredentials([string(credentialsId: 'password', variable: 'password')]) {
                        sh 'sudo docker login -u sudarsank -p $password'
                    }
                
                    sh 'sudo docker push sudarsank/edureka_final_project:latest'
            }
            }
            stage('Docker_CleanUP'){
                agent any
                steps{
                    sh 'sudo docker ps -f name=mycont -q | xargs --no-run-if-empty sudo docker container stop'
                    sh 'sudo docker container ls -a -fname=mycont -q | xargs -r sudo docker container rm'
                }
            }
            stage('Docker_Run'){
                agent any
                steps{
                    sh 'sudo docker run --name mycont -d -p 8140:80 sudarsank/edureka_final_project:latest'
                }
            }
            
            stage('Selenium_Test'){
                agent {label'windows_slave'}
                steps{
                    git 'https://github.com/sudarsank14/edureka_finalproject.git'
                    bat 'mvn test'
                }
            }            
            
        }   
}
