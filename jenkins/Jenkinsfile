pipeline {
    agent any

    stages {
        stage('Deploy') {
            steps {
                 sh '''
                   chmod +x deploy.sh
                   ./deploy.sh
                    '''
            }
        }

        stage('Output'){
            steps {
                sh '''
                   chmod +x output.sh
                   ./output.sh
                    '''
            }
        }

        stage('Ansible_run'){
            steps {
                sh '''
                   chmod +x ansible.sh
                   ./ansible.sh
                    '''
            }
        }
    }

}

