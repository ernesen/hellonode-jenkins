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
