***POC to test and deploy boundary server with terraform in docker***
|#   [Start/Reload the docker-compose deployment]|  |
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


|#   [Explanation of Boundary Terraform's files]|  |
|---------------------------|--|
|                           |  |
auth: auth method for boundary scopes
hosts: list of all hosts
main: terraform config
principles: groups creation + accounts binded to users
roles:binding accounts to groups/roles
scopes:boundary hierarchy
target:list all target than can be reached by authorized users
variables: all variables(user strings)

./run login not working with script for the moment so :

boundary authenticate password -auth-method-id=ampw_lQYqii34wM -login-name=lorris -password=password -keyring-type=none -format=json | jq -r ".token" > boundary_token.txt

export BOUNDARY_TOKEN=token


TEST DE CONNEXION:
boundary connect -exec redis-cli -target-id ttcp_CLMe0qgsyH






doc boundary:https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/group

doc Terraform boundary:https://www.boundaryproject.io/docs/getting-started/run-and-login
