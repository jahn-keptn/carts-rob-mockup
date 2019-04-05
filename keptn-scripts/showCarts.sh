#!/bin/bash

LOG_LOCATION=./logs
exec > >(tee -i $LOG_LOCATION/showCarts.log)
exec 2>&1

export DEV_IP=$(kubectl -n dev get svc carts -o json | jq -r '.status.loadBalancer.ingress[0].ip')
export INGRESS_IP=$(kubectl get svc istio-ingressgateway -n istio-system -o=json | jq -r .status.loadBalancer.ingress[].ip)

export DEV_VERSION=$(curl -s "http://carts.dev.$DEV_IP.xip.io/version")
export STAGING_VERSION=$(curl -s "http://carts.staging.$INGRESS_IP.xip.io/version")
export PRODUCTION_VERSION=$(curl -s "http://carts.production.$INGRESS_IP.xip.io/version")

echo ""
echo "--------------------------------------------------------------------------"
echo "CARTS microservice:"
echo "--------------------------------------------------------------------------"
echo "Dev running        @ http://carts.dev.$DEV_IP.xip.io/"
echo "Staging running    @ http://carts.staging.$INGRESS_IP.xip.io/"
echo "Production running @ http://carts.production.$INGRESS_IP.xip.io/"
echo "----------------------------------"
echo "Running Version:"
echo "----------------------------------"
echo "Dev        : $DEV_VERSION"
echo "Staging    : $STAGING_VERSION"
echo "Production : $PRODUCTION_VERSION"
echo "--------------------------------------------------------------------------"
echo "kubectl -n dev get pods"
echo "--------------------------------------------------------------------------"
kubectl -n dev get pods
echo "--------------------------------------------------------------------------"
echo "kubectl -n staging get pods"
echo "--------------------------------------------------------------------------"
kubectl -n staging get pods
echo "--------------------------------------------------------------------------"
echo "kubectl -n production get pods"
echo "--------------------------------------------------------------------------"
kubectl -n production get pods
echo "--------------------------------------------------------------------------"
echo ""
