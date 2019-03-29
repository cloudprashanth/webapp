node{
   stage('SCM Checkout'){
        git branch: 'f1', url: 'https://github.com/itzprashanth/webapp.git'
	   }
	      stage('Compile-Package'){
	             sh label: '', script: 'mvn clean package'
		        }
			   stage('Code Quality'){
			          sh label: '', script: '''mvn sonar:sonar \\
				              -Dsonar.projectKey=java \\
					                  -Dsonar.host.url=http://35.190.182.96:9000 \\
							              -Dsonar.login=ab2cc2ddaf0bb79cded6fa0f00cdcd6d5eeb2ad7'''
								         }
									    stage('Upload Atifact to Nexus'){
									           nexusPublisher nexusInstanceId: 'nexus', 
										          nexusRepositoryId: 'new', 
											         packages: [[$class: 'MavenPackage', mavenAssetList: 
												             [[classifier: '', extension: '', filePath: 'target/webapp.war']], 
													                 mavenCoordinate: [artifactId: 'webapp', groupId: 'com.prashanth', packaging: 'war', version: '1.1']]]
															    }
															       stage('Deploy to Tomcat'){
															              sh label: '', script: 'curl -T "target/webapp.war" "http://tomcat:tomcat@35.190.182.96:6060/manager/text/deploy?path=/web&update=true"'
																         }
																	 }
