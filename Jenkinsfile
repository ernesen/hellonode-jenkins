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
        sh "mkdir -p ${WORKSPACE}/output"
        // Write an useful file, which is needed to be archived.
        writeFile file: "output/usefulfile.txt", text: "This file is useful, need to archive it."
        //sh(returnStdout: true, script: "touch build.properties").trim();
        //sh(returnStdout: true, script: 'echo "Triggering job for branch " > build.properties').trim();
        //sh(returnStdout: true, script: 'echo "BUILD=${BUILD_NUMBER}" >> build.properties').trim();
        //sh(returnStdout: true, script: 'echo "WORKSPACE=${WORKSPACE}" >> build.properties').trim();
        //sh(returnStdout: true, script: 'echo "Running jobname ${JOB_NAME} with build ${BUILD_ID} on url ${JENKINS_URL}" >> build.properties').trim();

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
