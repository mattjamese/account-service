 //using hostname.

//[code language="java"]
node {

    withMaven(maven:'maven') {

        stage('Checkout') {
            git url: 'https://github.com/mattjamese/account-service.git', CredentialsID: 'mattjamese', branch: 'master'
        }

        stage('Build') {
            sh 'mvn clean install'

            def pom = readMavenPom file:'pom.xml'
            print pom.version
            env.version = pom.version
        }

        stage('Image') {
           // dir ('Account-Service') {
                def app = docker.build "192.168.1.245:5000/account-service:${env.version}"
                app.push()
           // }
        }

        stage ('Run') {
            docker.image("192.168.1.245:5000/account-service:${env.version}").run('-p 2222:2222 -h account --name account --link discovery')
        }

        stage ('Final') {
            build job: 'customer-service-pipeline', wait: false
        }      

    }

}
