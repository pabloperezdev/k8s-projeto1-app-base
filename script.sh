#!/bin/bash
echo "Criando as imagens ..."

docker build-t pabloperezdev/projeto-backend:1.0 backend/.
docker build-t pabloperezdev/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push pabloperezdev/projeto-backend:1.0
docker push pabloperezdev/projeto-database:1.0

echo "Criando servicos no cluster kubernets ..."

kubectl apply -f ./services.yml

echo "Criando os deployments ....."

kubectl apply -f ./deployment.yml

