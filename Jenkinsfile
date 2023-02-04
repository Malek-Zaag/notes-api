pipeline{
  agent any
  environment{
    PORT=credentials("PORT")
    DB_URI=credentials("DB_URI")
  }
  stages{
    stage("testing stage"){
      steps{
        script {                   
          sh "npm i"
          sh "printenv" 
          def testOutput = sh (script: "npm run test",returnStdout: true)
          sh "echo $testOutput"
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
  }
}
}

//  withCredentials([string(credentialsId: "DB_URI",variable: "DB_URI")]){
//             echo "My secret uri is ${DB_URI}"
//             env.DB_URI=DB_URI
//           }
//           withCredentials([string(credentialsId: 'PORT', variable: 'PORT')]) { 
//             echo "My secret port is ${PORT}"
//             env.PORT=PORT
//           }
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