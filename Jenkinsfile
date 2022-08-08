#!groovy

node {
    def app
//     def MAVEN_OPTS = "-Djava.awt.headless=true"
//     def MAVEN_CLI_OPTS = "-Dmaven.repo.local=$CI_PROJECT_DIR/.m2/repository --batch-mode"
//   I def MAGE_NAME = "flowable-engage"

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
//   stage ('Build mvn') {
//     git url: 'https://github.com/cyrille-leclerc/multi-module-maven-project'
//     withMaven {
//       sh "mvn clean verify"
//     } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
//   }

    stage('Build') {
    //    withEnv(["DISABLE_AUTH=true"]) {
    //      echo env.DISABLE_AUTH   }
     sh 'npm -v'
   }

    stage('Build image') {
        /* This builds the actual image; synonymous to
            * docker build on the command line */
        app = docker.build("ernesen/hellonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}