#!groovy

def gobal_app = "gobal_app toto"
REPO_URL   = "https://github.com/ernesen/test.git"

node {
    
    def app      = "toto"
    PARAM1       = 'My value is here'
    DISABLE_AUTH = 'true'
    DB_ENGINE    = 'mysql'
    
    stage('Clone repository') {
      /* Let's make sure we have the repository cloned to our workspace */
      checkout scm
    }
    
    stage('Triggering job for branchs') {
      sh "echo 'Triggering job for branch' > build.properties"
      sh "echo 'BUILD_NUMBER=${BUILD_NUMBER}' >> build.properties"
      sh "echo 'WORKSPACE=${WORKSPACE}' >> build.properties"
      sh "echo 'JOB_NAME=${JOB_NAME}' >> build.properties"
      sh "echo 'BUILD_ID=${BUILD_ID}' >> build.properties"
      sh "echo 'JENKINS_URL=${JENKINS_URL}' >> build.properties"
      sh "ehho 'REPO_URL=${REPO_URL}' >> build.properties" 
      sh "cat ${WORKSPACE}/build.properties"
    }
    
    stage('Run Pipeline') {
      build job: 'E2E_tests_pipeline', parameters: [string(name: 'MY_PARAM', value: 'value from Build pipeline')]
    }
 
    stage('Run local variables') {
      echo "gobal_app=${gobal_app}"
      echo "app=${app}"
      echo "PARAM1=${PARAM1}" 
      echo "DISABLE_AUTH=${DISABLE_AUTH}"
      echo "DB_ENGINE=${DB_ENGINE}"
    } 
    
    stage('Run groovy-file-name.groovy') {
      def pipeline = load 'groovy-file-name.groovy'
      sh "echo 'gobal_app=${gobal_app}' > toto.txt" 
      sh "echo 'app=${app}' >> toto.txt" 
      sh "echo 'PARAM1=${PARAM1}' >> toto.txt" 
      sh "echo 'DISABLE_AUTH=${DISABLE_AUTH}' >> toto.txt" 
      sh "echo 'DB_ENGINE=${DB_ENGINE}' >> toto.txt" 
    } 
    
    stage('Run Jenkins.p1') {
      def pipeline = load 'Jenkinsfile.p1'
    } 
    
   stage('git clone') {
     sh "rm -rf ${WORKSPACE}/test/"  
     sh "git clone ${REPO_URL}"
     sh "ls -al ${WORKSPACE}/test/"  
     sh "cat ${WORKSPACE}/test/README.md"    
   }
    
   stage('name value pair') {
      sh "chmod +x ./properties.sh"
      sh "./properties.sh"  
   }
}
