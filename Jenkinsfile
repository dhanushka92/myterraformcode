pipeline {
agent any
stages {

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
