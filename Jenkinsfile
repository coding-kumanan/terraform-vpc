pipeline {
    agent any
    environment{
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'select your Environment')
    }
    stages{
        stage('Terraform init'){
            steps{
                sh "terrafile -f env-${ENV}/Terrafile"
                sh "terraform init -backend-config=env-${ENV}/${ENV}-backend.tfvars"
            }

        }
        stage('Terraform plan'){
            steps{
                sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
            }
        }
        stage('Terraform Apply'){
            steps{
                sh "terraform apply -auto-approve -var-file=env-${ENV}/${ENV}.tfvars"
            }
        }
    }
}
