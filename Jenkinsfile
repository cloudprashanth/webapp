properties([parameters([choice(choices: 'development\nrelease', description: 'Select Branch to build', name: 'branch')])])
node{
    
   stage('SCM Checkout'){
    echo "Pulling changes from the branch ${params.branch}"
        git url: 'https://github.com/itzprashanth/webapp.git', branch: "${params.branch}"
   }
   stage('Compile-Package'){
       sh label: '', script: 'mvn clean package'
   }
   stage('Code Quality'){
       sh label: '', script: '''mvn sonar:sonar \\
            -Dsonar.projectKey=java \\
            -Dsonar.host.url=http://35.237.77.124:9000 \\
            -Dsonar.login=ab2cc2ddaf0bb79cded6fa0f00cdcd6d5eeb2ad7'''
   }
   stage('Upload Atifact to Nexus'){
       nexusPublisher nexusInstanceId: 'nexus', 
       nexusRepositoryId: 'new', 
       packages: [[$class: 'MavenPackage', mavenAssetList: 
            [[classifier: '', extension: '', filePath: 'target/webapp.war']], 
            mavenCoordinate: [artifactId: 'webapp', groupId: 'com.prashanth', packaging: 'war', version: "1.$BUILD_NUMBER"]]]
   }
   stage('Deploy to Dev or Prod as per Choice'){
       sh label: '', script: '''if [ "$branch" = "development" ]; then
	        curl -T "target/webapp.war" "http://tomcat:tomcat@35.237.77.124:6060/manager/text/deploy?path=/web&update=true"
            fi
            if [ "$branch" = "release" ]; then
	            curl -T "target/webapp.war" "http://tomcat:tomcat@35.237.77.124:7070/manager/text/deploy?path=/web&update=true"
            fi
            '''
   }
}