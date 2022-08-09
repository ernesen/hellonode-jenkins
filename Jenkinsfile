#!groovy

node {
    def app = "toto"
    environment{
        PARAM1 = "My value is here"
    }
    
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Triggering job for branchs') {
        sh(returnStdout: true, script: 'echo "Triggering job for branch " > build.properties').trim();
        sh 'echo "BUILD=${BUILD_NUMBER}" >> build.properties'
        sh 'echo "WORKSPACE=${WORKSPACE}" >> build.properties'
        sh 'echo "Running jobname ${JOB_NAME} with build ${BUILD_ID} on url ${JENKINS_URL}" >> build.properties'
        sh(returnStdout: true, script: "touch build.properties").trim();
    }
    
    stage('Run Pipeline') {
        build job: 'E2E_tests_pipeline', parameters: [string(name: 'MY_PARAM', value: 'value from Build pipeline')]
    }
    
    stage('Run groovy-file-name.groovy') {
        def pipeline = load 'groovy-file-name.groovy'
        sh 'echo "${app}" > toto.txt' 
    } 
    
    stage('Run Jenkins.p1') {
        def pipeline = load 'Jenkinsfile.p1'
    } 
}
