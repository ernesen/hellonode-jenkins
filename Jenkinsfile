#!groovy

node {
    def app
    environment{
        PARAM1 = "My value is here"
    }
    
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Run Pipeline') {
//         build job: 'E2E_tests_pipeline', parameters: [string(name: 'MY_PARAM', value: 'value from Build pipeline')], propagate: true
//         def handle = triggerRemoteJob(remoteJenkinsName: 'E2E_tests_pipeline', job: 'RemoteJob' paramters: "param1=${env.PARAM1}\nparam2='param2'")
           def handle = triggerRemoteJob(remoteJenkinsName: 'remoteJenkins', job: 'E2E_tests_pipeline' paramters: "param1=${env.PARAM1}\nparam2='param2'")

    }
    
    stage('Run groovy-file-name.groovy') {
        def pipeline = load 'groovy-file-name.groovy'
    } 
    
    stage('Run Jenkins.p1') {
        def pipeline = load 'Jenkinsfile.p1'
    } 
}
