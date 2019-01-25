pipeline {
    agent {
        docker {
            image 'ruby'
            args '--link selenium'
        }
    }
    environment {
        CI = true
    }
    stages {
        stage('Run bundle') {
            steps {
                sh "bundle install"
            }
        }
        stage('Run SmokeTest') {
            steps {
                script {
                    try {
                        sh "bundle exec cucumber -p ci -t @smoke"
                    } finally {
                        cucumber fileIncludePattern: '**/*.json', 
                        jsonReportDirectory: 'log',
                        sortingMethod: 'ALPHABETICAL'
                    }
                }
            }
        }
        stage('Notificando no Slack') {
            steps {
                slackSend baseUrl: 'https://hooks.slack.com/services/',
                channel: '#builds',
                color: 'good',
                message: 'Testes processados com sucesso!',
                tokenCredentialId: 'slack-build'
            }
        }
        stage('Read to Production?') {
            steps {
                input message: 'Testes finalizados com sucesso. Podemos ir para produção?'
                echo "Faz de conta que vai subir para produção."
            }
        }
    }
}