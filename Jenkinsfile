#!groovy
// Building your first Docker image with Jenkins 2: Guide for developers
// https://tutorials.releaseworksacademy.com/learn/building-your-first-docker-image-with-jenkins-2-guide-for-developers
// https://docs.cloudbees.com/docs/admin-resources/latest/plugins/docker-workflow
// https://stackoverflow.com/questions/72078335/jenkins-docker-container-run-docker-build-inside-the-container
// https://phoenixnap.com/kb/how-to-configure-docker-in-jenkins
// https://www.bogotobogo.com/DevOps/Docker/Docker-Jenkins-Master-Slave-Agent-ssh.php
// https://www.jenkins.io/doc/book/pipeline/docker/
// https://devopscube.com/docker-containers-as-build-slaves-jenkins/
// https://phoenixnap.com/kb/jenkins-environment-variables
// https://www.lambdatest.com/blog/set-jenkins-pipeline-environment-variables-list/

// https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
// https://www.jenkins.io/doc/book/installing/docker/

// How To Install Docker In Jenkins Container
// https://faun.pub/how-to-install-docker-in-jenkins-container-4c49ba40b373 (******)

node {
    def app
//     def MAVEN_OPTS = "-Djava.awt.headless=true"
//     def MAVEN_CLI_OPTS = "-Dmaven.repo.local=$CI_PROJECT_DIR/.m2/repository --batch-mode"
//   I def MAGE_NAME = "flowable-engage"

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }
  stage ('Build mvn') {
    git url: 'https://github.com/cyrille-leclerc/multi-module-maven-project'
    withMaven {
      sh "mvn clean verify"
    } // withMaven will discover the generated Maven artifacts, JUnit Surefire & FailSafe reports and FindBugs reports
  }
    stage('Build') {
        // sh "echo - Build"
    //    withEnv(["DISABLE_AUTH=true"]) {
    //      echo env.DISABLE_AUTH   }
     sh 'npm install'
    //  newgroup docker
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