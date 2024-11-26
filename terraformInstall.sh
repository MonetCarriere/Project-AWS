#!/bin/bash

## CONDITIONAL 1
# Update package lists
echo "Installing Prerequisites..."

# Check if gnupg is in the apt cache
if apt-cache show gnupg; then
    echo "gnupg already exists in the apt cache 👍"
else
    echo "gnupg not found in apt cache, updating package lists 🔄"
    sudo apt update
fi

# Check if software-properties-common is in the apt cache
if apt-cache show software-properties-common; then
    echo "software-properties-common already exists in the apt cache 👍"
else
    echo "software-properties-common not found in apt cache, updating package lists 🔄"
    sudo apt update
fi

# Install gnupg 
if (which gnupg);
then
    echo "gnupg is already installed 🎉"
else
    echo "Installing gnupg...⬇️"
    sudo apt-get install -y gnupg
    echo "gnupg is installed ✨👍"
fi

# Install software-properties-common
if (which software-properties-common); 
then
  echo "software-properties-common is installed 🎉"
else
  echo "Installing software-properties-common...⬇️"
  sudo apt-get install -y software-properties-common
  echo "software-properties-common is installed ✨👍"
fi


## CONDITIONAL 2

# Check if the keyring file exists
if ( stat /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null 2>&1 )
then
    echo "HashiCorp GPG key already exists at /usr/share/keyrings/hashicorp-archive-keyring.gpg."
else
    echo "HashiCorp GPG key not found. Adding HashiCorp GPG key."
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi

## CONDITIONAL 3 it actually is two if thens. 

if gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
then 
  echo 'The keys fingerprint is verified'
else 
  echo 'the fingerprint is not verified, lets try again to get it right my dude!'
  wget -O- https://apt.releases.hashicorp.com/gpg | \
  gpg --dearmor | \
  sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
fi
# if verification fails, retrieve keys from hashicorp archive again.  
echo "Re-verifying the GPG key..."
if gpg --no-default-keyring \
       --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
       --fingerprint
then
  echo "The GPG key was successfully re-added and verified."
else
  echo "Failed to verify the GPG key after re-adding it. Please check manually."
 
fi

## CONDITIONAL 4

# Check if the HashiCorp repository file exists
if (stat /etc/apt/sources.list.d/hashicorp.list > /dev/null 2>&1)
then
    echo "HashiCorp repository already exists at /etc/apt/sources.list.d/hashicorp.list."
else
    echo "HashiCorp repository not found. Adding repository."
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list > /dev/null
fi

# Check cache for Hashicorp repo

if (apt show "https://apt.releases.hashicorp.com" > /dev/null 2>&1)
then
    echo "HashiCorp repository already exists in the apt cache."
else
    echo "Updating apt cache."
    sudo apt update
fi

## CONDITIONAL 5
# Check if Terraform is installed
if ( command -v terraform > /dev/null 2>&1 )
then
    echo "Terraform is already installed."
else
    echo "Terraform is not installed. Installing Terraform."
    sudo apt-get install -y terraform
fi

## CONDITIONAL 6
echo "Installation complete. Run 'terraform --version' to verify."
