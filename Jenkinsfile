Jenkinsfile (Declarative Pipeline)
node {
    stage('checkout'){
        checkout scm
    }    

    stage('deploy'){
        chmod a+x bin/helm
        mv bin/helm /usr/local/bin/helm
        helm kafka ./kafka upgrade -f values.yaml --kube-context flink-sh4 --namespace kafka --dry-run --debug
        helm kafka ./kafka upgrade -f values.yaml --kube-context flink-sh4 --namespace kafka --install
    }
}

