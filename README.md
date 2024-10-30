# Project-AWS
1: Create a Vm. ❌
2: Install Terraform. ❌
3: Create a AWS instance. ❌ 


# PROJECT COMMANDS:

# 1
To start the project run:
`bash create-vm.sh`

# 2
To transfer file from local to vm, cd to Project-AWS and run the following command:
`multipass transfer TFInstall.sh awesome-vm:/home/ubuntu`

# 3
To install Terraform in the VM shell into your multipass VM and run the TFInstall.sh script: 
`multipass shell awesome-vm`
`bash TFInstall.sh`

