# Project-AWS
1: Create a Vm. ❌
2: Install Terraform. ❌
3: Create a AWS instance. ❌ 


# PROJECT COMMANDS:

# 1
To start the project on a Linux run:
`bash create-vm.sh`
To start the project on a Mac run:
`zsh create-vm.sh`


# 2
To transfer file from local to vm, cd to Project-AWS and run the following command:
`multipass transfer installTerraInVm.sh awesome-vm:/home/ubuntu`


# 3
To install Terraform in the VM shell into your multipass VM and run the installTerraInVm.sh script: 
`multipass shell awesome-vm`
