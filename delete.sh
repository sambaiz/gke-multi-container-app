#!/bin/bash

context=`kubectl config current-context`
echo "${context}で実行します。よろしいですか[Y/N]"
read ANSWER
case $ANSWER in
    "Y" ) :;;
    * ) exit;;
esac
if [ $context = "minikube" ] ; then
  kubectl delete -f yaml/gateway_service_minikube.yaml
  kubectl delete -f yaml/service_deployment_minikube.yaml
  kubectl delete -f yaml/gateway_deployment_minikube.yaml
else
  kubectl delete -f yaml/gateway_service.yaml
  kubectl delete -f yaml/service_deployment.yaml
  kubectl delete -f yaml/gateway_deployment.yaml
fi
kubectl delete -f yaml/service_service.yaml
