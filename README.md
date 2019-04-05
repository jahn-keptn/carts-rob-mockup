# Overview

A microservices-demo service that provides shopping carts for users.  Based on a generic microservices application, built [weaveworks](https://github.com/microservices-demo/carts).

This contains the expected folders and files to work with the [keptn framework](https://keptn.sh/docs)
* Jenkinsfile - build app, create a docker image
* monspec folder with these file:
  * <service>_monspec.json - used during quality gate check
* perfspec folder with these file:
  * perfspec.json
  * perfspec_dynatrace.json
  * perfspec_prometheus.json
* jmeter folder with three files: 
  * basiccheck.jmx - used a post-deployment valiation to ensure service is running
  * <service>_perfcheck.jmx - used as a warmup prior to load test
  * <service>_load.jmx - used as a load test

Other noteworthly files in this repo
* ```keptn-onboarding/``` folder - the YAML files passed in the keptn CLI for on-boarding the carts project and services
* ```keptn-scripts/``` folder - utility scripts that are helpful when following the [keptn example app](https://keptn.sh/docs)
* ```api-spec/``` folder - contains the files as to produce REST api explorer for the root URL
* ```version``` file - the value in this file is using in the Jenkins built to label the Docker image
* ```src/main/resources/application.properties``` file - can be updated to control service behavior such as simulated problems

# Local development

Assumes to have mongoDB running with uri of mongodb://carts-db:27017/carts-db

### Building
mvn -B clean package

### Running
mvn spring-boot:run
