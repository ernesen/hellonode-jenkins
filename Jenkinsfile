#!groovy

node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }

    stage('Run Pipeline') {
        build job: 'E2E_tests_pipeline', parameters: [string(name: 'MY_PARAM', value: 'value from Build pipeline')]
    }
    
    stage('Run groovy-file-name.groovy') {
        def pipeline = load 'groovy-file-name.groovy'
        //pipeline.pipeline()
    }    
}
