pipeline {
agent any
stages {

   /* stage('Checkout') {
      steps {
        git credentialsId: '9282ea37-8649-44cb-98d6-bd6ed031e82f', url: 'https://github.com/dhanushka92/myterrapipeline.git'
        echo 'stage1'
      }
    }*/
stage('Set Terraform path') {
 steps {
 script{
 def tfHome = tool name:'Terraform'
 echo 'def'
 env.PATH = "${tfHome}:${env.PATH}"
   echo  env.PATH
 //wrap([$class: 'AnsiColorBuildWrapper', colorMapName: 'xterm'])
 }
bat label: '', script: 'terraform -version'
 //sh label: '', script: 'terraform -version'
 }
}
stage('Provision infrastructure') {
 steps {
   bat label: '', script: 'terraform init'
 //bat label: '', script: 'terraform plan'
 bat label: '', script: 'terraform plan -out=plan'
// bat label: '', script: 'terraform plan -out myplan'
// bat label: '', script: 'terraform apply -auto-approve'
// bat label: '', script: 'terraform apply plan'
 }
}
  stage('Approval') {
      steps {
        script {
          def userInput = input(id: 'confirm', message: 'Apply Terraform?', parameters: [ [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Apply terraform', name: 'confirm'] ])
        }
      }
    }
stage('TF Apply') {
      steps {
        
          bat label: '', script: 'terraform apply plan'
        
      }
    }
}
}
