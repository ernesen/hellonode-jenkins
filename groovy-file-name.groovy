node {
    stage('aws --version') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'aws --version'
    }
    
    stage('Running kubectl') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'kubectl'
    }
    
    stage('kustomize version') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'kustomize version'
    }
    
    stage('mvn -version') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'mvn -version'
    } 
    
    stage('npm -version') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'npm -v; node -v'
    } 
}  
