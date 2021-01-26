### Some commands
```sh
serverless config credentials --provider aws --key ACCESS_KEY --secret SECRET_KEY --profile GithubActionsServerlessUser
# profile can be any name for the profile
# we can have multiple profiles setup
# We can use this profile in the serverless.yml file
# under the provider, with profile as key and profileValue as its value.
# This will tell serverless to use that profile's credentials for
# deployment and other stuff.

serverless create --template aws-nodejs --path PATH-TO-DIR
# Create a serverless project from a template

serverless deploy --stage production
# Deploy

```

### Sample serverless yaml
```yaml
# Welcome to Serverless!
#
# This file is the main config file for your service.
# It's very minimal at this point and uses default values.
# You can always add more config options for more control.
# We've included some commented out config examples here.
# Just uncomment any of them to get that config option.
#
# For full config options, check the docs:
#    docs.serverless.com
#
# Happy Coding!

service: name-of-the-service
# app and org for use with dashboard.serverless.com
#app: your-app-name
#org: your-org-name

# You can pin your service to only deploy with a specific Serverless version
# Check out our docs for more details
frameworkVersion: '2'

provider:
  name: aws
  runtime: nodejs12.x
  lambdaHashingVersion: 20201221
  region: ap-south-1
  stage: dev
  profile: LambdaDeployer  # make sure to define the profile during the serverless config
  environment:
    tableName: ${self:custom.tableName}
  iamRoleStatements:
    - Effect: Allow
      Action:
        - dynamodb:*
        - s3:*
        - ses:*
      Resource: '*'

  # If in an endpoint, you set private: true, it will return 403 if API key not provided
  apiKeys:
    - basic:
      - MyAPIKey
    - premium:
      - MyAPIKey2
  usagePlan:
    - basic:
      quota:
        limit: 100
        period: MONTH
      throttle:
        rateLimit: 5
        burstLimit: 10
    - premium:
      quota:
        limit: 100000
        period: MONTH
      throttle:
        rateLimit: 10
        burstLimit: 20

# you can add statements to the Lambda function's IAM Role here
#  iamRoleStatements:
#    - Effect: "Allow"
#      Action:
#        - "s3:ListBucket"
#      Resource: { "Fn::Join" : ["", ["arn:aws:s3:::", { "Ref" : "ServerlessDeploymentBucket" } ] ]  }
#    - Effect: "Allow"
#      Action:
#        - "s3:PutObject"
#      Resource:
#        Fn::Join:
#          - ""
#          - - "arn:aws:s3:::"
#            - "Ref" : "ServerlessDeploymentBucket"
#            - "/*"

# you can define service wide environment variables here
#  environment:
#    variable1: value1

# you can add packaging information here
#package:
#  include:
#    - include-me.js
#    - include-me-dir/**
#  exclude:
#    - exclude-me.js
#    - exclude-me-dir/**

plugins:
  - serverless-s3-sync  # npm i -S serverless-s3-sync
  - serverless-webpack  # npm i -S webpack serverless-webpack && touch webpack.config.js && echo "module.exports = {\n\ttarget: 'none',\n\tmode: 'none'\n};" > webpack.config.js
  - serverless-domain-manager  # npm i -D serverless-domain-manager

package:
  individually: true

custom:
  tableName: some-table-name
  # To access in JS file: const tableName = process.env.tableName
  s3Sync:
    - bucketName: BucketNameDefinedInResources
      localDir: build  # In case of react.
  customDomain:
    - domainName: devops-worker.vighnesh153.com
      basePath: ''
      stage: ${self:provider.stage}

functions:
  hello:
    handler: handler.hello

  getUser:
    handler: lambdas/getUser.handler
    events:
      - httpApi:
        path: /get-user/{ID}
        method: GET
        cors: true

  proxy:
    handler: lambdas/some.handler
    events:
      - httpApi:
        path: /some-path/{proxy+}
        method: ANY
        integration: http-proxy
        request:
          uri: https://api.vighnesh153.com/{proxy}
          parameters:
            paths:
              proxy: true
#    The following are a few example events you can configure
#    NOTE: Please make sure to change your handler code to work with those events
#    Check the event documentation for details
#    events:
#      - httpApi:
#          path: /users/create
#          method: get
#      - websocket: $connect
#      - s3: ${env:BUCKET}
#      - schedule: rate(10 minutes)
#      - sns: greeter-topic
#      - stream: arn:aws:dynamodb:region:XXXXXX:table/foo/stream/1970-01-01T00:00:00.000
#      - alexaSkill: amzn1.ask.skill.xx-xx-xx-xx
#      - alexaSmartHome: amzn1.ask.skill.xx-xx-xx-xx
#      - iot:
#          sql: "SELECT * FROM 'some_topic'"
#      - cloudwatchEvent:
#          event:
#            source:
#              - "aws.ec2"
#            detail-type:
#              - "EC2 Instance State-change Notification"
#            detail:
#              state:
#                - pending
#      - cloudwatchLog: '/aws/lambda/hello'
#      - cognitoUserPool:
#          pool: MyUserPool
#          trigger: PreSignUp
#      - alb:
#          listenerArn: arn:aws:elasticloadbalancing:us-east-1:XXXXXX:listener/app/my-load-balancer/50dc6c495c0c9188/
#          priority: 1
#          conditions:
#            host: example.com
#            path: /hello

#    Define function environment variables here
#    environment:
#      variable2: value2

# you can add CloudFormation resource templates here
#resources:
#  Resources:
#    SomeResource:
#      Type: AWS::S3::Bucket
#      Properties:
#        BucketName: my-new-bucket
#    MyDynamoDbTable:
#      Type: AWS::DynamoDB::Table
#      Properties:
#        TableName: ${self:custom.tableName}
#        AttributeDefinitions:
#          - AttributeName: ID
#            AttributeType: S
#        KeySchema:
#          - AttributeName: ID
#            KeyType: HASH
#        BillingMode: PAY_PER_REQUEST
#  Outputs:
#     NewOutput:
#       Description: "Description for the output"
#       Value: "Some output value"
```
