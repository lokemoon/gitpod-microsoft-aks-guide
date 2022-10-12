source .env
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
az login --use-device-code
az aks install-cli
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME
curl https://kots.io/install | bash

echo "sudo kubectl kots install gitpod"
echo "sudo kubectl kots admin-console --namespace gitpod"