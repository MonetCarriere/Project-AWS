# Project-AWS
1: Create a Vm. ✅
2: Install Terraform. ❌
3: Create a AWS instance. ❌ 


# PROJECT COMMANDS:

# 1
To start the project run:

```shell
bash create-vm.sh
```

# 2
To transfer file from local to vm, cd to Project-AWS and run the following command:

```shell
multipass transfer terraformInstall.sh awesome-vm:/home/ubuntu
```

# 3
To install Terraform in the VM shell into your multipass VM and run the TFInstall.sh script: 

```shell
multipass shell awesome-vm
bash terraformInstall.sh
```

# 4
To stop and delete the VM run this command:

```shell
multipass delete awesome-vm --purge
```
