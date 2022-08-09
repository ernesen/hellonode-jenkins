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
        echo "Triggering job for branch ${env.BRANCH_NAME}"
        echo "BUILD=${BUILD_NUMBER}" > build.properties
        echo "WORKSPACE=${WORKSPACE}" >> build.properties
        echo "Running jobname ${env.JOB_NAME} with build ${env.BUILD_ID} on url ${env.JENKINS_URL}" >> build.properties
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
