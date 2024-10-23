#!/bin/bash

# Check if gnupg is installed
if (apt-cache show gnupg); then
    echo 'gnupg is already installed'
else
    sudo apt-get update
    echo 'Installing gnupg and software-properties-common...'
    sudo apt-get install -y gnupg software-properties-common
fi

# Check for apt-cache status
if apt-cache search gnupg && apt-cache search software-properties-common; then
    echo 'Package cache is up to date'
else
    echo 'Updating package cache...'
    sudo apt-get update
fi

# Check for HashiCorp GPG key
if gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint | grep HashiCorp; then
    echo 'HashiCorp GPG key is already present and verified.'
else
    echo 'Adding HashiCorp GPG key...'
    wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi

# Check for HashiCorp repository
if test -f /etc/apt/sources.list.d/hashicorp.list; then
    echo 'HashiCorp repository is already present.'
else
    echo 'Adding HashiCorp repository...'
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
fi

# Check if apt needs updating after potential repository addition
if (apt-cache show terraform)
  then 
  echo 'terrform package is already up to date'
else
  apt update
fi

# Check for Terraform installation
if terraform --version; then
    echo 'Terraform is already installed.'
else
    echo 'Installing Terraform...'
    sudo apt-get install -y terraform
fi

echo 'Terraform installation script completed successfully!'
