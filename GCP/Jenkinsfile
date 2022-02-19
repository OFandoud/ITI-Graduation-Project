
pipeline {
    agent {label 'slave-1' }

    stages {
        stage('Build image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'user' ,  passwordVariable: 'pass',)])       {
    		sh """
    		    docker build . -t ofandoud/hello-world:latest
    		    docker login -u ${user} -p ${pass}
    		    docker push ofandoud/hello-world:latest
    		    echo done
    		"""
                }
            }
        }
        stage ('deploy app'){
            steps {
                sh """
                kubectl apply -f prod.yaml
                echo done
            """
            }
        }
        }
    }
