#!/bin/bash

context=`kubectl config current-context`
echo "${context}で実行します。よろしいですか[Y/N]"
read ANSWER
case $ANSWER in
    "Y" ) :;;
    * ) exit;;
esac
if [ $context = "minikube" ] ; then
  kubectl create -f yaml/gateway_service_minikube.yaml
  kubectl create -f yaml/service_deployment_minikube.yaml
  kubectl create -f yaml/gateway_deployment_minikube.yaml
else
  kubectl create -f yaml/gateway_service.yaml
  kubectl create -f yaml/service_deployment.yaml
  kubectl create -f yaml/gateway_deployment.yaml
fi
kubectl create -f yaml/service_service.yaml
