#!/bin/bash

cd hmh_testing_concourse
echo "into directory"

git pull 
echo "taking latest changes"

git checkout sample-jar
echo "checkout successfully"

cd helloworld
echo "inside directory"

mvn clean install
echo "built successfully"

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 298841451579.dkr.ecr.us-east-1.amazonaws.com
echo "login successful"

docker build -t pipeline_testing_hmh .
echo "build succesful"

docker tag pipeline_testing_hmh:latest 298841451579.dkr.ecr.us-east-1.amazonaws.com/pipeline_testing_hmh:latest
echo "tag successful"

docker push 298841451579.dkr.ecr.us-east-1.amazonaws.com/pipeline_testing_hmh:latest
echo "pushed successfully"


docker pull 298841451579.dkr.ecr.us-east-1.amazonaws.com/pipeline_testing_hmh:latest
echo "pulled successfully"

cd ../
echo "out from the cloned repository"
kubectl create deployment helloworld --image=298841451579.dkr.ecr.us-east-1.amazonaws.com/pipeline_testing_hmh:latest --dry-run -o=yaml > deployment.yaml
echo "create deployment successfully"

echo --- >> deployment.yaml

kubectl create service clusterip helloworld --tcp=8081:8081 --dry-run -o=yaml >> deployment.yaml
echo "service created successfully"

sleep 15
echo "sleep and start continuing to work"

kubectl apply -f deployment.yaml
echo "apply successful"

sleep 10
echo "sleep and start continuing to work"

kubectl get all
echo "output deployment"

kubectl port-forward service/helloworld 8081:8081
echo "port forward successful"

curl localhost:8081/hello-world/
echo "curl output seccessful"
