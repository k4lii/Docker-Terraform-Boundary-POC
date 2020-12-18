***POC to test and deploy boundary server with terraform in docker***
|#   [Start the docker-compose deployment]|  |
|---------------------------|--|
|                           |  |
./run all

|#   [Cleanup containers/temp files]|  |
|---------------------------|--|
|                           |  |
./run cleanup

|#   [Login to your Boundary CLI]|  |
|---------------------------|--|
|                           |  |
./run login 

login not working with script for the moment so : 

sudo apt install jq -y

boundary authenticate password -auth-method-id=ampw_lQYqii34wM -login-name=lorris -password=password -keyring-type=none -format=json | jq -r ".token" > boundary_token.txt

export BOUNDARY_TOKEN=token


TEST DE CONNEXION:
boundary connect -exec redis-cli -target-id ttcp_CLMe0qgsyH



doc boundary:https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/group

doc Terraform boundary:https://www.boundaryproject.io/docs/getting-started/run-and-login
