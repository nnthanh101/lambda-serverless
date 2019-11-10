#! /bin/bash

echo "Installing Serverless"
echo "------------------------------"

npm install -g serverless
# npm install serverless-dynamodb-local serverless-offline serverless-stack-output
npm install serverless-dynamodb-local serverless-offline

echo "Deploying to $env"
echo "------------------------------"

# export SLS_DEBUG=*
env

aws iam list-roles
# aws s3api create-bucket --bucket lambda-serverless

echo "serverless deploy --stage $env --package $CODEBUILD_SRC_DIR/artifacts/$env -v"
serverless deploy --stage $env --package $CODEBUILD_SRC_DIR/artifacts/$env -v

echo "Deploy done"