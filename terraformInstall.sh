#!/bin/bash

## CONDITIONAL 1
# Update package lists
echo "Installing Prerequisites..."
if sudo apt update; then
    echo "Package lists updated successfully ✅"
else
    echo "Failed to update package lists ❌"
fi

# Install gnupg and software-properties-common
echo "Installing gnupg and software-properties-common..."
if sudo apt-get install -y gnupg software-properties-common; then
    echo "gnupg and software-properties-common installed successfully 😊👍"
else
    echo "Failed to install gnupg and software-properties-common 🙁👎"
fi

## CONDITIONAL 2
#echo "Adding HashiCorp GPG key..."
#wget -O- https://apt.releases.hashicorp.com/gpg | \
   # gpg --dearmor | \
   # sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

## CONDITIONAL 3
#echo "Verifying GPG key..."
#gpg --no-default-keyring \
   # --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
   # --fingerprint

## CONDITIONAL 4
#echo "Adding HashiCorp repository..."
#echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
   # https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
   # sudo tee /etc/apt/sources.list.d/hashicorp.list

## CONDITIONAL 5
#echo "Updating package lists..."
#sudo apt update

## CONDITIONAL 6
#echo "Installing Terraform..."
#sudo apt-get install terraform

## CONDITIONAL 7
#echo "Installation complete. Run 'terraform --version' to verify."
