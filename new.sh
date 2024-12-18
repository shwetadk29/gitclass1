pipeline {
    agent any  // This specifies that Jenkins can run this pipeline on any available agent.

    environment {
        // Environment variables can be set here if needed
        MY_ENV_VAR = 'example_value'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the repository
                git 'https://github.com/your-repo/example.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    // Run the build process (e.g., with Maven, Gradle, or custom scripts)
                    echo 'Building the application...'
                    sh './build.sh'  // Replace with your build command
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests, e.g., unit tests, integration tests, etc.
                    echo 'Running tests...'
                    sh './run_tests.sh'  // Replace with your test command
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy your application, e.g., to a test environment
                    echo 'Deploying the application...'
                    sh './deploy.sh'  // Replace with your deploy command
                }
            }
        }

        stage('Post-Deployment Check') {
            steps {
                script {
                    // Run any checks after deployment, e.g., monitoring health, smoke tests, etc.
                    echo 'Running post-deployment checks...'
                    sh './post_deploy_check.sh'  // Replace with your post-deployment check command
                }
            }
        }
    }

    post {
        always {
            // Actions that should always be performed (e.g., cleanup)
            echo 'Cleaning up after the pipeline run.'
            // cleanup commands if needed
        }

        success {
            // Actions for when the pipeline completes successfully
            echo 'Pipeline finished successfully!'
        }

        failure {
            // Actions for when the pipeline fails
            echo 'Pipeline failed. Investigate the issue.'
        }

        unstable {
            // Actions for unstable runs
            echo 'Pipeline ran with unstable status.'
        }
    }
}
