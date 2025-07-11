pipeline {
  agent any
  environment {
    IMAGE_NAME = "yourdockerhub/demo:${env.BUILD_NUMBER}"
  }
  stages {
    stage('Checkout') {
      steps { git 'https://github.com/pa1087/aws-eks-devops-demo.git' }
    }
    stage('Build') {
      steps { sh 'mvn -f app/pom.xml clean package' }
    }
    stage('Docker Build & Push') {
      steps {
        script {
          docker.build("${IMAGE_NAME}", ".")
          docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials') {
            docker.image("${IMAGE_NAME}").push()
          }
        }
      }
    }
    stage('Deploy to EKS') {
      steps {
        sh 'kubectl apply -f k8s/nginx-deployment.yaml'
        sh 'kubectl apply -f k8s/service.yaml'
      }
    }
  }
}
