#!/bin/bash

## CONDITIONAL 1
echo "Installing prerequisites..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

#!/bin/bash

# Check if gpg is installed
if ( which gpg > /dev/null 2>&1 )
then
    echo "gpg is installed."
else
    echo "Error: gpg is not installed. Please install it before running this script."
    exit 1
fi

# Check if the keyring file exists using stat
if (stat /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null 2>&1)
then
    echo "HashiCorp GPG key already exists."
else
    echo "HashiCorp GPG key not found. Adding HashiCorp GPG key."

    # Add the HashiCorp GPG key
    wget -O- https://apt.releases.hashicorp.com/gpg |
    gpg --dearmor |
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi


## CONDITIONAL 3
echo "Verifying GPG key..."
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

## CONDITIONAL 4
echo "Adding HashiCorp repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list

## CONDITIONAL 5
echo "Updating package lists..."
sudo apt update

## CONDITIONAL 6
echo "Installing Terraform..."
sudo apt-get install terraform

## CONDITIONAL 7
echo "Installation complete. Run 'terraform --version' to verify."
