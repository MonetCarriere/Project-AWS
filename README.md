# Project-AWS
1: Create a Vm. ✅
2: Install Terraform. ❌
3: Create a AWS instance. ❌ 


# PROJECT COMMANDS:

# 1
To create the VM:

```shell
bash create-vm.sh
```

# 2
To transfer the Terraform file from local to VM:

```shell
multipass transfer terraformInstall.sh awesome-vm:/home/ubuntu
```

#3
To install Terraform from your local machine:
```shell
multipass exec awesome-vm -- bash terraformInstall.sh
```

# 4
To shell into your multipass VM: 

```shell
multipass shell awesome-vm
```

# 5
To stop and delete the VM run this command:

```shell
multipass delete awesome-vm --purge
```
