# Overview

A microservices-demo service that provides shopping carts for users.  Based on a generic microservices application, built [weaveworks](https://github.com/microservices-demo/carts).

This contains the expected folders and files to work with the [keptn framework](https://keptn.sh/docs)
* ```Jenkinsfile``` - build app, create a docker image
* monspec folder with these file:
  * ```<service>_monspec.json``` - used during quality gate check
* ```perfspec/``` folder with these file:
  * ```perfspec.json```
  * ```perfspec_dynatrace.json```
  * ```perfspec_prometheus.json```
* ```jmeter/``` folder with three files: 
  * ```basiccheck.jmx``` - used a post-deployment valiation to ensure service is running
  * ```<service>_perfcheck.jmx``` - used as a warmup prior to load test
  * ```<service>_load.jmx``` - used as a load test

Other noteworthly files in this repo
* ```keptn-onboarding/``` folder - the YAML files passed in the keptn CLI for on-boarding the carts project and services
* ```keptn-scripts/``` folder - example scripts that are helpful when following the [cart app keptn use cases](https://keptn.sh/docs)
* ```api-spec/``` folder - contains the files as to produce REST api explorer for the root URL
* ```version``` file - the value in this file is using in the Jenkins built to label the Docker image
* ```src/main/resources/application.properties``` file - can be updated to control service behavior such as simulated problems

# Keptn Onboading

Assuming you have a cluster with [Keptn](https://keptn.sh/docs) installed as well as the [keptn CLI](https://keptn.sh/docs) configured to your git org, you can run these command to create a project and onboard the carts services and carts mongo database.
```
cd keptn-onboarding

# create the project
keptn create project carts-project shipyard.yaml

# onboard carts
keptn onboard service --project=carts-project --values=values_carts.yaml

# onboard carts database
keptn onboard service --project=carts-project --values=values_carts_db.yaml --deployment=deployment_carts_db.yaml --service=service_carts_db.yaml
``` 

# keptn example scripts

These scripts are helpful when following the [cart app keptn use cases](https://keptn.sh/docs). To try out the scripts just run these commands
```
cd keptn-scripts

# show the Keptn pods and ingress gateway
./showKeptn.sh

# show the Dynatrace pods and Dynatrace Kube secrets file
./showDynatrace.sh

# show the URL to the running Jenkins server
./showJenkins.sh
```

# Local development

Assumes to have mongoDB running with uri of mongodb://carts-db:27017/carts-db

### Building
mvn -B clean package

### Running
mvn spring-boot:run
