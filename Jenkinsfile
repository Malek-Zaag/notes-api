pipeline{
  agent any
  environment{
    PORT=credentials("PORT")
    DB_URI=credentials("DB_URI")
  }
  stages{
    stage("testing stage"){
      steps{                
          sh "npm i"
          sh "printenv" 
          sh "npm run test"
          junit 'junit.xml'
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