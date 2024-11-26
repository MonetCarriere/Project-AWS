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
echo "Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

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
