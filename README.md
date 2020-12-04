# terraform-boundary-POC
POC to test and deploy boundary server with terraform in docker


[Boundary dependencies]
sudo apt-get install -y dbus-x11
sudo apt-get install -y gnome-keyring

[Error opening keyring: Specified keyring backend not available
Token must be provided via BOUNDARY_TOKEN env var or -token flag. Reading the token can also be disabled via -keyring-type=none.]
export BOUNDARY_ADDR=http://localhost:9200
export BOUNDARY_TOKEN=token

[start terraform]
./terraform init
./terraform plan -out planfile
./terraform apply planfile

[Authentification to boundary in CLI]
boundary authenticate password -auth-method-id=ampw_1234567890 -login-name=admin -password=password -keyring-type=none
