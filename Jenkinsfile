#!groovy

def gobal_app = "gobal_app toto"
def GIT_URL ="https://github.com/ernesen/test.git"

node {
    
    def app = "toto"
    PARAM1       = 'My value is here'
    DISABLE_AUTH = 'true'
    DB_ENGINE    = 'mysql'
    
    stage('Clone repository') {
      /* Let's make sure we have the repository cloned to our workspace */
      checkout scm
    }

    stage('Triggering job for branchs') {
      //sh "mkdir -p ${WORKSPACE}/output"
      sh 'echo "Triggering job for branch " > build.properties'
      sh 'echo "BUILD=${BUILD_NUMBER}" >> build.properties'
      sh 'echo "WORKSPACE=${WORKSPACE}" >> build.properties'
      sh 'echo "Running jobname ${JOB_NAME} with build ${BUILD_ID} on url ${JENKINS_URL}" >> build.properties'
      sh "cat /var/jenkins_home/workspace/hellonode-jenkins/build.properties"
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
     sh "git clone ${GIT_URL}"
     sh "ls -al ${WORKSPACE}/test/"  
     sh "cat ${WORKSPACE}/test/README.md"    
   }
    
   stage('name value pair') {
      def pipeline = load 'Jenkinsfile.pair'  
   }
}
