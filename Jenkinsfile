pipeline {
    agent any
    options {
        ansiColor('xterm')
    }
    parameters{
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'select your Environment')
        choice(name: 'ACTION', choices: ['apply', 'destroy'], description: 'select your Action')
    }
    stages{
        stage('Terraform init'){
            steps{
                sh "terrafile -f env-${ENV}/Terrafile"
                sh "terraform init -reconfigure -backend-config=env-${ENV}/${ENV}-backend.tfvars"
            }

        }
        stage('Terraform plan'){
            steps{
                sh "terraform plan -var-file=env-${ENV}/${ENV}.tfvars"
            }
        }
        stage('Terraform Action'){
            steps{
                sh "terraform ${ACTION} -auto-approve -var-file=env-${ENV}/${ENV}.tfvars"
            }
        }
    }
}
