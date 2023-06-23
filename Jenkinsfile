pipeline {
    agent any 

    parameters {
        choice (name: 'TARGET_ENV', choices: ["dev","sit"], description : "target deployment environment")
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials ('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials ('AWS_SECRET_ACCESS_KEY')
    }
    
    stages {
        stage ("download code and env config") {
            steps {
                sh 'git clone https://github.com/Simi-DevOps/codebase.git'
                sh 'git clone https://github.com/Simi-DevOps/env.git'
            }
        }
        stage ('plan') {
            steps {
                sh '''
                   cd codebase/dev
                   terraform init -backend-config=../../env/"${TARGET_ENV}"/backend.tfvars
                   terraform plan -var-file ../../env/"${TARGET_ENV}"/backend.tfvars  -var-file ../env/"${TARGET_ENV}"/ec2.tfvars -auto-approve
                '''
                script {
                    env.NEXT_STEP = input message: 'Implement Plan?', ok: 'Implement',
                    parameters: [choice (name: 'Implement', choices: 'apply\ndestroy\ndo nothing', description: 'implementation stage')]
                }
            }
        }
        stage ('implement apply') {
            when {
                any of{
                expression {
                    env.NEXT_STEP == 'apply'
                }
                expression {
                    env.NEXT_STEP == 'destroy'
            }
                }
            }
            steps {
                sh '''
                   cd codebase/dev
                   terraform init -backend-config=../../env/"${TARGET_ENV}"/backend.tfvars
                   terraform apply -var-file ../../env/"${TARGET_ENV}"/backend.tfvars  -var-file ../env/"${TARGET_ENV}"/ec2.tfvars -auto-approve
                '''
            }
        }
    }
    
    post {
        always {
            deleteDir()
        }
    }
}