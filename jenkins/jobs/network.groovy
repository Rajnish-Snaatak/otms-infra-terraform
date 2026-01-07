pipelineJob('dev-network-terraform') {
    description('Deploy DEV Network Skeleton using Terraform')

    definition {
        cps {
            script("""
pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
    }

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Rajnish-Snaatak/otms-infra-terraform.git'
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([[
                    \$class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws-dev-creds'
                ]]) {
                    script {
                        def modules = [
                            'vpc',
                            'subnets',
                            'igw',
                            'nat',
                            'routes',
                            'nacls',
                            'acm',
                            'alb',
                            'route53-records'
                        ]

                        for (m in modules) {
                            dir("dev/network/\${m}") {
                                sh '''
                                  terraform init -reconfigure
                                  terraform plan
                                  terraform apply -auto-approve
                                '''
                            }
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            echo "DEV Network Skeleton deployed successfully"
        }
        failure {
            echo "Terraform deployment failed"
        }
    }
}
""")
            sandbox()
        }
    }
}
