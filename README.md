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
./run login auth-method-id
export BOUNDARY_TOKEN=$(cat boundary_token.txt)

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

TEST DE CONNEXION:
boundary connect -exec ssh -target-id xxxxxxx -- lorris@localhost -p 22
boundary connect -exec redis-cli -target-id xxxxxx -- -h 192.168.96.2 -p 6379

doc boundary:https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/group

doc Terraform boundary:https://www.boundaryproject.io/docs/getting-started/run-and-login
