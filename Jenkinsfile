pipeline {

  agent any
stages {

    stage('Checkout') {
      steps {
        checkout scm
        
        git branch:'master',url: 'https://github.com/dhanushka92/myterrapipeline.git'
      }
    }
  stage('set terraform path'){
    steps{
      script{
        def tfHome= tool name:'Terraform' env.PATH="${tfHome}:${env.Path}"
      }
      sh 'terraform -version'
    }
  }

    stage('TF Plan') {
      steps {
        container('terraform') {
          sh 'terraform init'
          sh 'terraform plan -out myplan'
        }
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
        container('terraform') {
          sh 'terraform apply -input=false myplan'
        }
      }
    }

  } 

}
