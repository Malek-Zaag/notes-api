pipeline{
  agent any
  environment{
    // AZURE_REPO='myprivaterepo.azurecr.io'
    PORT='3000'
    DB_URI='mongodb+srv://admin:admin@cluster0.gkmmv.mongodb.net/notes-api?retryWrites=true&w=majority'
  }
  stages{
    stage("testing stage"){
      steps{
        script {    
          sh "npm i"
          sh "printenv"
          def testOutput = sh "npm run test"
          sh "echo ${testOutput}"
                    if (true) {
                        stage ('Stage 1') {
                            sh 'echo Stage 1'
                        }
                    }
                    if (false) {
                        stage ('Stage 2') {
                            sh 'echo Stage 2'
                        }
                    }
        }    
      }
         
    }
    stage("build image"){
      steps{
        sh "docker build -t notes-api-docker-image ." 
        sh "docker images"
        echo "image built successfully"
        
    }
    // stage("verify"){
    //     steps{
    //         sh "echo hello"
    //         echo "verification"
    //     }
    // }
    // stage("push image to ACR"){
    //   steps{
    //     echo "pushing to ACR stage"
    //     withCredentials([usernamePassword(credentialsId: 'azure-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]){
    //       sh "echo $PASS | docker login ${AZURE_REPO} --username $USER --password-stdin"
    //       sh "nslookup myprivaterepo.azurecr.io"
    //       sh "docker push myprivaterepo.azurecr.io/library-management-api"
    //     }
    //     echo "image pushed successfully to azure container registry"
    //   }
    // }
  }
}
}