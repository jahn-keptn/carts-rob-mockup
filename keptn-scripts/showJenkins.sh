#!/bin/bash

LOG_LOCATION=./logs
exec > >(tee -i $LOG_LOCATION/showJenkins.log)
exec 2>&1

export INGRESS_IP=$(kubectl get svc istio-ingressgateway -n istio-system -o=json | jq -r .status.loadBalancer.ingress[].ip)

echo ""
echo "--------------------------------------------------------------------------"
echo "Jenkins is running @"
echo "http://jenkins.keptn.$INGRESS_IP.xip.io/"
echo "--------------------------------------------------------------------------"
echo ""
